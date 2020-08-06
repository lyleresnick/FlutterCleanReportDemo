//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:flutter/foundation.dart';
import '../../../entities/TransactionEntity.dart';
import '../../../entities/TransactionGroup.dart';
import '../../../managers/TwoSourceManager.dart';
import '../use_case/TransactionListViewReadyUseCaseOutput.dart';

class TransactionListViewReadyTwoSourceUseCaseTransformer {

    final TwoSourceManager _transactionManager;

    TransactionListViewReadyTwoSourceUseCaseTransformer({@required TwoSourceManager transactionManager}) : _transactionManager = transactionManager;

    transform({TransactionListViewReadyUseCaseOutput output}) {

        var grandTotal = 0.0;
        output.presentInit();

        grandTotal += transformGroup(transactions: _transactionManager.fetchAuthorizedTransactions(), group: TransactionGroup.authorized, output: output);
        grandTotal += transformGroup(transactions: _transactionManager.fetchPostedTransactions(), group: TransactionGroup.posted, output: output);
        output.presentGrandFooter(grandTotal: grandTotal);

        output.presentReport();
    }

    double transformGroup({List<TransactionEntity> transactions, TransactionGroup group, TransactionListViewReadyUseCaseOutput output}) {

        var total = 0.0;
        output.presentHeader(group: group);

        if(transactions != null) {

            if(transactions.length == 0) {
                output.presentNoTransactionsMessage(group: group);
            }
            else {
                var transactionStream = transactions.iterator;
                var transaction = next(transactionStream);

                while(transaction != null) {

                    final currentDate = transaction.date;
                    output.presentSubheader(date: currentDate);

                    while(transaction != null && transaction.date == currentDate) {

                        total += transaction.amount;
                        output.presentDetail(description: transaction.description, amount: transaction.amount);
                        transaction = next(transactionStream);
                    }
                    output.presentSubfooter();
                }
                output.presentFooter(total: total);
            }
        }
        else {
            output.presentGroupNotFoundMessage(group: group);
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
