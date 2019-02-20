import 'package:flutter/material.dart';
import 'TransactionListCell.dart';
import '../../presenter/TransactionListRowViewModel.dart';

class TransactionListFooterCell extends TransactionListCell {

    final TransactionListFooterViewModel row;

    TransactionListFooterCell({@required TransactionListRowViewModel row})
            : assert(row is TransactionListFooterViewModel, "Expected: footer"),
                row = row as TransactionListFooterViewModel;

    @override
    Widget build(BuildContext context) {
        return Text("footer ${row.total}, ${row.odd} ");
    }
}