//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'dart:async';

import 'package:flutter_clean_report_demo/repo/entities/TransactionEntity.dart';
import 'package:flutter_clean_report_demo/repo/entities/TransactionGroup.dart';
import 'package:flutter_clean_report_demo/repo/factory/Result.dart';
import 'package:flutter_clean_report_demo/repo/factory/TransactionManager.dart';

import 'TransactionListPresentationModel.dart';

class TransactionListViewReadyOneSourceUseCaseTransformer {
  final TransactionManager transactionManager;

  TransactionListViewReadyOneSourceUseCaseTransformer({required this.transactionManager});

  Future<List<TransactionListRowPresentationModel>> transform() async {
    var grandTotal = 0.0;
    final output = <TransactionListRowPresentationModel>[];

    final result = await transactionManager.fetchAllTransactions();
    switch (result) {
      case SuccessResult(:final data):
        var groupStream = [TransactionGroup.authorized, TransactionGroup.posted].iterator;
        var currentGroup = next(groupStream);

        var transactionStream = data!.iterator;
        var transaction = next(transactionStream);

        var minGroup = determineMinGroup(group: currentGroup, transaction: transaction);
        while (minGroup != null) {
          output.add(TransactionListHeaderRowPresentationModel(minGroup));

          if ((transaction == null) || (minGroup != transaction.group)) {
            output.add(TransactionListNoTransactionsInGroupRowPresentationModel(minGroup));
            currentGroup = next(groupStream);
            minGroup = determineMinGroup(group: currentGroup, transaction: transaction);
          } else {
            var total = 0.0;
            var odd = false;
            while ((transaction != null) && (transaction.group == minGroup)) {
              final currentDate = transaction.date;
              odd = !odd;
              output.add(TransactionListSubheaderRowPresentationModel(currentDate, odd));

              while ((transaction != null) &&
                  (transaction.group == minGroup) &&
                  (transaction.date == currentDate)) {
                final amount = transaction.amount;
                total += amount;
                grandTotal += amount;
                output.add(TransactionListDetailRowPresentationModel(
                    transaction.description, amount, odd));

                transaction = next(transactionStream);
              }
              output.add(TransactionListSubfooterRowPresentationModel(odd));
            }
            odd = !odd;
            output.add(TransactionListFooterRowPresentationModel(total, odd));
            currentGroup = next(groupStream);
            minGroup = determineMinGroup(group: currentGroup, transaction: transaction);
          }
        }
      case FailureResult(:final code, :final description):
        output.add(TransactionListFailureRowPresentationModel(code!, description!));
    }
    output.add(TransactionListGrandFooterRowPresentationModel(grandTotal));
    return output;
  }

  T? next<T>(Iterator<T> transactionStream) {
    if (transactionStream.moveNext())
      return transactionStream.current;
    else
      return null;
  }

  TransactionGroup? determineMinGroup({TransactionGroup? group, TransactionEntity? transaction}) {
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
