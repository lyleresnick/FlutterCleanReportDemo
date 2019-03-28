import 'package:flutter/material.dart';
import '../../presenter/TransactionListRowViewModel.dart';
import 'TransactionListCell.dart';

class TransactionListSubheaderCell extends TransactionListCell {

    final TransactionListSubheaderViewModel row;

    TransactionListSubheaderCell({@required TransactionListRowViewModel row})
            : assert(row is TransactionListSubheaderViewModel, "Expected: subheader"),
                row = row;

    @override
    Widget build(BuildContext context) {
        return Container(
                height: row.height,
                color: backgroundColour(row.odd),
                padding: new EdgeInsets.only(left: 20.0),
                alignment: Alignment(-1, .5),
                child: Text(row.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                        )
                )
        );
    }
}