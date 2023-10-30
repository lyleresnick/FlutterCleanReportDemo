//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TransactionList.dart';

@visibleForTesting
class PresentationModel {
  late final List<RowPresentationModel> rows;
  final String? errorMessage;

  PresentationModel.fromTwoSources(
      {required List<Transaction> authorizedTransactions,
      required List<Transaction> postedTransactions,
      this.errorMessage}) {
    final (authTotal, authRows) =
        transformGroup(transactionList: authorizedTransactions, group: TransactionGroup.authorized);
    final (postTotal, postRows) =
        transformGroup(transactionList: postedTransactions, group: TransactionGroup.posted);
    final grandTotal = authTotal + postTotal;
    final rows = authRows + postRows;

    rows.add(GrandFooterRowPresentationModel(grandTotal));
    this.rows = rows;
  }

  (double, List<RowPresentationModel>) transformGroup(
      {required List<Transaction> transactionList, required TransactionGroup group}) {
    var total = 0.0;
    final rows = <RowPresentationModel>[];
    rows.add(HeaderRowPresentationModel(group));
    if (transactionList.length == 0) {
      rows.add(NoTransactionsInGroupRowPresentationModel(group));
      return (0, rows);
    }

    var transactionStream = transactionList.iterator;
    var transaction = _next(transactionStream);
    var odd = false;
    while (transaction != null) {
      final currentDate = transaction.date;
      odd = !odd;
      rows.add(SubheaderRowPresentationModel(currentDate, odd));
      while (transaction != null && transaction.date == currentDate) {
        total += transaction.amount;
        rows.add(DetailRowPresentationModel(transaction.description, transaction.amount, odd));
        transaction = _next(transactionStream);
      }
      rows.add(SubfooterRowPresentationModel(odd));
    }
    odd = !odd;
    rows.add(FooterRowPresentationModel(total, odd));

    return (total, rows);
  }

  Transaction? _next(Iterator<Transaction> transactionStream) {
    if (transactionStream.moveNext())
      return transactionStream.current;
    else
      return null;
  }

  PresentationModel.fromOneSource({required List<Transaction> allTransactions, this.errorMessage}) {
    var grandTotal = 0.0;
    final rows = <RowPresentationModel>[];

    var groupStream = [TransactionGroup.authorized, TransactionGroup.posted].iterator;
    var currentGroup = next(groupStream);

    var transactionStream = allTransactions.iterator;
    var transaction = next(transactionStream);

    var minGroup = _determineMinGroup(group: currentGroup, transaction: transaction);
    while (minGroup != null) {
      rows.add(HeaderRowPresentationModel(minGroup));

      if ((transaction == null) || (minGroup != transaction.group)) {
        rows.add(NoTransactionsInGroupRowPresentationModel(minGroup));
        currentGroup = next(groupStream);
        minGroup = _determineMinGroup(group: currentGroup, transaction: transaction);
      } else {
        var total = 0.0;
        var odd = false;
        while ((transaction != null) && (transaction.group == minGroup)) {
          final currentDate = transaction.date;
          odd = !odd;
          rows.add(SubheaderRowPresentationModel(currentDate, odd));

          while ((transaction != null) &&
              (transaction.group == minGroup) &&
              (transaction.date == currentDate)) {
            final amount = transaction.amount;
            total += amount;
            grandTotal += amount;
            rows.add(DetailRowPresentationModel(transaction.description, amount, odd));

            transaction = next(transactionStream);
          }
          rows.add(SubfooterRowPresentationModel(odd));
        }
        odd = !odd;
        rows.add(FooterRowPresentationModel(total, odd));
        currentGroup = next(groupStream);
        minGroup = _determineMinGroup(group: currentGroup, transaction: transaction);
      }
    }
    rows.add(GrandFooterRowPresentationModel(grandTotal));
    this.rows = rows;
  }

  T? next<T>(Iterator<T> transactionStream) {
    if (transactionStream.moveNext())
      return transactionStream.current;
    else
      return null;
  }

  TransactionGroup? _determineMinGroup({TransactionGroup? group, Transaction? transaction}) {
    if ((group == null) && (transaction == null)) {
      return null;
    } else if (group == null) {
      return transaction!.group;
    } else if (transaction == null) {
      return group;
    } else {
      return group.rawValue.compareTo(transaction.group.rawValue) < 0 ? group : transaction.group;
    }
  }
}
