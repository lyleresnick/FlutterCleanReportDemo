import 'package:flutter/material.dart';
import 'TransactionListCell.dart';
import '../../presenter/TransactionListRowViewModel.dart';

class TransactionListMessageCell extends TransactionListCell {

    final TransactionListMessageViewModel row;

    TransactionListMessageCell({@required TransactionListRowViewModel row})
            : assert(row is TransactionListMessageViewModel, "Expected: message"),
                row = row as TransactionListMessageViewModel;

    @override
    Widget build(BuildContext context) {
        return Text("message ${row.message} ");
    }
}