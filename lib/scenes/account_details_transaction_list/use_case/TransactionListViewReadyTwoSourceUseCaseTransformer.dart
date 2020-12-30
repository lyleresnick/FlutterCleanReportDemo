//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_clean_report_demo/repo/entities/TransactionEntity.dart';
import 'package:flutter_clean_report_demo/repo/entities/TransactionGroup.dart';
import 'package:flutter_clean_report_demo/repo/factory/Result.dart';
import 'package:flutter_clean_report_demo/repo/factory/TransactionManager.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/use_case/TransactionListUseCaseOutput.dart';

class TransactionListViewReadyTwoSourceUseCaseTransformer {

    final TransactionManager transactionManager;

    TransactionListViewReadyTwoSourceUseCaseTransformer({@required this.transactionManager});

    transform({StreamSink<TransactionListUseCaseOutput> output}) async {

        var grandTotal = 0.0;
        output.add(PresentInit());

        grandTotal += transformGroup(result: await transactionManager.fetchAuthorizedTransactions(), group: TransactionGroup.authorized, output: output);
        grandTotal += transformGroup(result: await transactionManager.fetchPostedTransactions(), group: TransactionGroup.posted, output: output);
        output.add(PresentGrandFooter(grandTotal));

        output.add(PresentReport());
    }

    double transformGroup({Result<List<TransactionEntity>, TransactionException> result, TransactionGroup group, StreamSink<TransactionListUseCaseOutput> output}) {
        var total = 0.0;
        output.add(PresentHeader(group));

        if (result is SuccessResult) {
            if (result.data.length == 0) {
                output.add(PresentNoTransactionsMessage(group));
            }
            else {
                var transactionStream = result.data.iterator;
                var transaction = next(transactionStream);

                while (transaction != null) {
                    final currentDate = transaction.date;
                    output.add(PresentSubheader(currentDate));

                    while (transaction != null &&
                            transaction.date == currentDate) {
                        total += transaction.amount;
                        output.add(PresentDetail(
                                transaction.description, transaction.amount));
                        transaction = next(transactionStream);
                    }
                    output.add(PresentSubfooter());
                }
                output.add(PresentFooter(total));
            }
        }
        else if (result is SemanticErrorResult) {
            output.add(PresentGroupNotFoundMessage(group));
        }
        else if (result is FailureResult) {
            output.add(PresentFailure(result.code, result.description));
        }

        return total;
    }


    TransactionEntity next(Iterator<TransactionEntity> transactionStream) {
        if (transactionStream.moveNext())
            return transactionStream.current;
        else
            return null;
    }

}
