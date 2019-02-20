import 'package:flutter/material.dart';
import 'TransactionListCell.dart';
import '../../presenter/TransactionListRowViewModel.dart';

class TransactionListSubfooterCell extends TransactionListCell {

    final TransactionListSubfooterViewModel row;

    TransactionListSubfooterCell({@required TransactionListRowViewModel row})
            : assert(row is TransactionListSubfooterViewModel, "Expected: subfooter"),
                row = row as TransactionListSubfooterViewModel;

    @override
    Widget build(BuildContext context) {
        return Text("subfooter ${row.odd}");
    }
}