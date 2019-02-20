import 'package:flutter/material.dart';
import 'TransactionListCell.dart';
import '../../presenter/TransactionListRowViewModel.dart';

class TransactionListSubheaderCell extends TransactionListCell {

    final TransactionListSubheaderViewModel row;

    TransactionListSubheaderCell({@required TransactionListRowViewModel row})
            : assert(row is TransactionListSubheaderViewModel, "Expected: subheader"),
                row = row as TransactionListSubheaderViewModel;

    @override
    Widget build(BuildContext context) {
        return Text("subheader ${row.title}, ${row.odd}");
    }
}