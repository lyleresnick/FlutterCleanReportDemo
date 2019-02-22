//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:flutter/foundation.dart';
import '../../../entities/TransactionEntity.dart';
import '../../../entities/TransactionGroup.dart';
import '../../../managers/OneSourceManager.dart';
import '../use_case/TransactionListViewReadyUseCaseOutput.dart';

class TransactionListViewReadyOneSourceUseCaseTransformer {

    final OneSourceManager _transactionManager;

    TransactionListViewReadyOneSourceUseCaseTransformer({@required OneSourceManager transactionManager}) : _transactionManager = transactionManager;

    transform({TransactionListViewReadyUseCaseOutput output}) {

        var grandTotal = 0.0;
        output.presentInit();

        final allTransactions = _transactionManager.fetchAllTransactions();
        if(allTransactions != null) {

            var groupStream = [TransactionGroup.authorized, TransactionGroup.posted].iterator;
            var currentGroup = next(groupStream);

            var transactionStream = allTransactions.iterator;
            var transaction = next(transactionStream);

            var minGroup = determineMinGroup(group: currentGroup, transaction: transaction);
            while(minGroup != null) {

                output.presentHeader(group: minGroup);

                if((transaction == null) || (minGroup != transaction.group)) {

                    output.presentNoTransactionsMessage(group: minGroup);
                    currentGroup = next(groupStream);
                    minGroup = determineMinGroup(group: currentGroup, transaction: transaction);
                }
                else {
                    var total = 0.0;

                    while((transaction != null) && (transaction.group == minGroup)) {

                        final currentDate = transaction.date;
                        output.presentSubheader(date: currentDate);

                        while((transaction != null)
                            && (transaction.group == minGroup)
                            && (transaction.date == currentDate)) {

                            final amount = transaction.amount;
                            total += amount;
                            grandTotal += amount;
                            output.presentDetail(description: transaction.description, amount: amount);

                            transaction = next(transactionStream);
                        }
                        output.presentSubfooter();
                    }
                    output.presentFooter(total: total);
                    currentGroup = next(groupStream);
                    minGroup = determineMinGroup(group: currentGroup, transaction: transaction);
                }
            }
        }
        else {
            output.presentNotFoundMessage();
        }
        output.presentGrandFooter(grandTotal: grandTotal);
        output.presentReport();
    }

    T next<T>(Iterator<T> transactionStream) {
        if (transactionStream.moveNext())
            return transactionStream.current;
        else
            return null;
    }

    TransactionGroup determineMinGroup({group: TransactionGroup, transaction: TransactionEntity}) {

        if((group == null) && (transaction == null)) {
            return null;
        }
        else if(group == null) {
            return transaction.group;
        }
        else if(transaction == null) {
            return group;
        }
        else {
             return (transactionGroupToString(group).compareTo(transactionGroupToString(transaction.group)) < 0) ? group : transaction.group;
        }
    }
}

