import 'package:flutter/material.dart';
import 'TransactionListCell.dart';
import '../../presenter/TransactionListRowViewModel.dart';
import 'package:flutter_clean_report_demo/colors.dart';

class TransactionListGrandFooterCell extends TransactionListCell {

    final TransactionListGrandFooterViewModel row;

    TransactionListGrandFooterCell({@required TransactionListRowViewModel row})
            : assert(row is TransactionListGrandFooterViewModel, "Expected: grandfooter"),
                row = row as TransactionListGrandFooterViewModel;


    @override
    Widget build(BuildContext context) {
        return Container(
                height: row.height,
                color: brandColor,
                padding: new EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Text("Grand Total", style: makeTextStyleGrandFooter()),
                        Text(row.grandTotal, style: makeTextStyleGrandFooter()),
                    ],
                )
        );
    }

    TextStyle makeTextStyleGrandFooter() {
        return TextStyle(
            color: Colors.white,
            fontSize: 16,
        );
    }

}