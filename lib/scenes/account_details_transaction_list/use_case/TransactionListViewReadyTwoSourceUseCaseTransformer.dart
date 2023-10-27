//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'dart:async';

import 'package:flutter_clean_report_demo/repo/entities/TransactionEntity.dart';
import 'package:flutter_clean_report_demo/repo/entities/TransactionGroup.dart';
import 'package:flutter_clean_report_demo/repo/factory/Result.dart';
import 'package:flutter_clean_report_demo/repo/factory/TransactionManager.dart';

import 'TransactionListPresentationModel.dart';

class TransactionListViewReadyTwoSourceUseCaseTransformer {
  final TransactionManager transactionManager;

  TransactionListViewReadyTwoSourceUseCaseTransformer({required this.transactionManager});

  Future<List<TransactionListRowPresentationModel>> transform() async {
    final (authTotal, authOutput) = transformGroup(
        result: await transactionManager.fetchAuthorizedTransactions(),
        group: TransactionGroup.authorized);
    final (postTotal, postOutput) = transformGroup(
        result: await transactionManager.fetchPostedTransactions(), group: TransactionGroup.posted);
    final grandTotal = authTotal + postTotal;
    final output = authOutput + postOutput;

    output.add(TransactionListGrandFooterRowPresentationModel(grandTotal));

    return output;
  }

  (double, List<TransactionListRowPresentationModel>) transformGroup(
      {required Result<List<TransactionEntity>> result,
      required TransactionGroup group}) {
    var total = 0.0;
    final output = <TransactionListRowPresentationModel>[];
    output.add(TransactionListHeaderRowPresentationModel(group));
    switch (result) {
      case SuccessResult(:final data):
        if (data!.length == 0) {
          output.add(TransactionListNoTransactionsInGroupRowPresentationModel(group));
        } else {
          var transactionStream = result.data!.iterator;
          var transaction = next(transactionStream);
          var odd = false;
          while (transaction != null) {
            final currentDate = transaction.date;
            odd = !odd;
            output.add(TransactionListSubheaderRowPresentationModel(currentDate, odd));
            while (transaction != null && transaction.date == currentDate) {
              total += transaction.amount;
              output.add(TransactionListDetailRowPresentationModel(
                  transaction.description, transaction.amount, odd));
              transaction = next(transactionStream);
            }
            output.add(TransactionListSubfooterRowPresentationModel(odd));
          }
          odd = !odd;
          output.add(TransactionListFooterRowPresentationModel(total, odd));
        }
      case FailureResult(:final code, :final description):
        output.add(TransactionListFailureRowPresentationModel(code!, description!));
    }

    return (total, output);
  }

  TransactionEntity? next(Iterator<TransactionEntity> transactionStream) {
    if (transactionStream.moveNext())
      return transactionStream.current;
    else
      return null;
  }
}
