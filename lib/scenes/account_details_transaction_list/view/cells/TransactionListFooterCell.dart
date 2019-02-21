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
        return Container(
                height: row.height,
                color: backgroundColour(row.odd),
                padding: new EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Text("Total", style: makeTextStyleFooter()),
                        Text(row.total, style: makeTextStyleFooter()),
                    ],
                )
        );
    }

    TextStyle makeTextStyleFooter() {
        return TextStyle(
            color: Colors.black,
            fontSize: 16,
        );
    }
}