//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'TransactionGroup.dart';

class TransactionEntity {

    final TransactionGroup group;
    final DateTime date;
    final String description;
    final double amount;

    static final _inboundDateFormatter = DateFormat("yyyy'-'MM'-'dd");

    TransactionEntity({@required this.group, @required this.date, @required this.description, @required this.amount});

    factory TransactionEntity.fromStrings({@required String group, @required String date, @required String description, @required String amount, @required String debit}) {
        TransactionGroup saveGroup;
        DateTime saveDate;
        double saveAmount;

        if (group == "A") {
          saveGroup = TransactionGroup.authorized;
        }
        else if (group == "P") {
          saveGroup = TransactionGroup.posted;
        }
        else {
            throw("Format of Group is incorrect");
        }
        try {
          saveDate = _inboundDateFormatter.parse(date);
        }
        catch (e) {
            throw("Format of Transaction Date is incorrect");
        }

        String sign;
        if (debit == "D") {
          sign = "";
        }
        else if (debit == "C") {
          sign = "-";
        }
        else {
            throw("Format of Transaction Sign is incorrect");
        }

        try {
            saveAmount = double.tryParse(sign + amount);
        }
        catch (e) {
            throw("Format of Transaction Amount is incorrect");
        }
        return TransactionEntity(
                group: saveGroup,
                date: saveDate,
                description: description,
                amount: saveAmount);
    }
}

final authorizedData = [

    TransactionEntity.fromStrings( group: "A", date: "2016-04-01", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-01", description: "Firkin", amount: "15.34", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-02", description: "Starbucks", amount: "5.22", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-05", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-07", description: "Starbucks", amount: "4.32", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-07", description: "TTC", amount: "28.00", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-09", description: "Starbucks", amount: "15.20", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-10", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-11", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-11", description: "Pizza Pizza", amount: "33.22", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-12", description: "Starbucks", amount: "5.22", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-12", description: "PetroGaz Ottawa", amount: "80.98", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-15", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-17", description: "Starbucks", amount: "4.32", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-17", description: "LCBO", amount: "400.55", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-19", description: "Starbucks", amount: "15.20", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-20", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-20", description: "Mr Greek", amount: "13.25", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-20", description: "Payment", amount: "400.00", debit: "C" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-21", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-22", description: "Starbucks", amount: "5.22", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-25", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-25", description: "Burrito Boyz", amount: "23.49", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-27", description: "Starbucks", amount: "4.32", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-27", description: "Georges Jazz Bar", amount: "56.49", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-29", description: "Starbucks", amount: "15.20", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-30", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "A", date: "2016-04-30", description: "Mark's Work Wearhouse", amount: "206.66", debit: "D" )
];

final postedData = [

    TransactionEntity.fromStrings( group: "P", date: "2016-05-01", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-02", description: "Starbucks", amount: "5.22", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-02", description: "Shell Steeles West", amount: "44.62", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-05", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-05", description: "The Rex", amount: "53.41", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-07", description: "Starbucks", amount: "4.32", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-09", description: "LCBO", amount: "45.20", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-09", description: "Starbucks", amount: "15.20", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-09", description: "Royal Ontario Museum", amount: "115.60", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-10", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-11", description: "Starbucks", amount: "6.21", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-11", description: "Domino's Pizza", amount: "33.22", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-12", description: "Starbucks", amount: "5.22", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-12", description: "PetroGaz Toronto", amount: "80.98", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-15", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-17", description: "Tim Horton's", amount: "4.32", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-17", description: "LCBO", amount: "400.55", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-19", description: "Starbucks", amount: "15.20", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-20", description: "Tim Hortons", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-20", description: "Mr Greek", amount: "13.25", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-20", description: "Payment", amount: "400.00", debit: "C" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-21", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-22", description: "Starbucks", amount: "5.22", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-25", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-25", description: "Burrito Boyz", amount: "23.49", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-27", description: "Starbucks", amount: "4.32", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-27", description: "Georges Jazz Bar", amount: "56.49", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-29", description: "Starbucks", amount: "15.20", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-30", description: "Starbucks", amount: "3.11", debit: "D" ),
    TransactionEntity.fromStrings( group: "P", date: "2016-05-30", description: "Mark's Work Wearhouse", amount: "206.66", debit: "D" ),
];

get allData =>  authorizedData + postedData;


