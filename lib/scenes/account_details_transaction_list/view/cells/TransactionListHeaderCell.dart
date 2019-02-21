import 'package:flutter/material.dart';
import 'TransactionListCell.dart';
import '../../presenter/TransactionListRowViewModel.dart';
import 'package:flutter_clean_report_demo/colors.dart';


class TransactionListHeaderCell extends TransactionListCell {

    final TransactionListHeaderViewModel row;

    TransactionListHeaderCell({@required TransactionListRowViewModel row})
        : assert(row is TransactionListHeaderViewModel, "Expected: header"),
          row = row as TransactionListHeaderViewModel;

  @override
  Widget build(BuildContext context) {
        return Container(
            height: row.height,
            color: brandColor,
            padding: new EdgeInsets.only(left: 20.0),
            alignment: Alignment(-1, 0),
            child: Text(row.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                )
            )
        );
    }
}