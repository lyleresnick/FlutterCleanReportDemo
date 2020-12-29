//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_clean_report_demo/entities/TransactionEntity.dart';
import 'package:flutter_clean_report_demo/entities/TransactionGroup.dart';
import 'package:flutter_clean_report_demo/managers/TransactionManager.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/use_case/TransactionListUseCaseOutput.dart';

class TransactionListViewReadyOneSourceUseCaseTransformer {

    final TransactionManager transactionManager;

    TransactionListViewReadyOneSourceUseCaseTransformer({@required this.transactionManager});

    transform({StreamSink<TransactionListUseCaseOutput> output}) {

        var grandTotal = 0.0;
        output.add(PresentInit());

        final allTransactions = transactionManager.fetchAllTransactions();
        if(allTransactions != null) {

            var groupStream = [TransactionGroup.authorized, TransactionGroup.posted].iterator;
            var currentGroup = next(groupStream);

            var transactionStream = allTransactions.iterator;
            var transaction = next(transactionStream);

            var minGroup = determineMinGroup(group: currentGroup, transaction: transaction);
            while(minGroup != null) {

                output.add(PresentHeader(minGroup));

                if((transaction == null) || (minGroup != transaction.group)) {

                    output.add(PresentNoTransactionsMessage(minGroup));
                    currentGroup = next(groupStream);
                    minGroup = determineMinGroup(group: currentGroup, transaction: transaction);
                }
                else {
                    var total = 0.0;

                    while((transaction != null) && (transaction.group == minGroup)) {

                        final currentDate = transaction.date;
                        output.add(PresentSubheader(currentDate));

                        while((transaction != null)
                            && (transaction.group == minGroup)
                            && (transaction.date == currentDate)) {

                            final amount = transaction.amount;
                            total += amount;
                            grandTotal += amount;
                            output.add(PresentDetail(transaction.description, amount));

                            transaction = next(transactionStream);
                        }
                        output.add(PresentSubfooter());
                    }
                    output.add(PresentFooter(total));
                    currentGroup = next(groupStream);
                    minGroup = determineMinGroup(group: currentGroup, transaction: transaction);
                }
            }
        }
        else {
            output.add(PresentNotFoundMessage());
        }
        output.add(PresentGrandFooter(grandTotal));
        output.add(PresentReport());
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

