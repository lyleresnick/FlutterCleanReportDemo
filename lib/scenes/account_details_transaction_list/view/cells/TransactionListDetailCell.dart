import 'package:flutter/material.dart';
import 'TransactionListCell.dart';
import '../../presenter/TransactionListRowViewModel.dart';

class TransactionListDetailCell extends TransactionListCell {

    final TransactionListDetailViewModel row;

    TransactionListDetailCell({@required TransactionListRowViewModel row})
            : assert(row is TransactionListDetailViewModel, "Expected: detail"),
                row = row as TransactionListDetailViewModel;

    @override
    Widget build(BuildContext context) {
        return Text("detail ${row.description}, ${row.odd}, ${row.amount}");
    }
}