import 'package:flutter/material.dart';
import 'TransactionListCell.dart';
import '../../presenter/TransactionListRowViewModel.dart';

class TransactionListGrandFooterCell extends TransactionListCell {

    final TransactionListGrandFooterViewModel row;

    TransactionListGrandFooterCell({@required TransactionListRowViewModel row})
            : assert(row is TransactionListGrandFooterViewModel, "Expected: grandfooter"),
                row = row as TransactionListGrandFooterViewModel;

    @override
    Widget build(BuildContext context) {
        return Text("grandfooter ${row.grandTotal} ");
    }
}