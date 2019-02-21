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
        return Container(
                height: row.height,
                color: Colors.white,
                padding: new EdgeInsets.only(left: 20.0),
                alignment: Alignment(-1, 0),
                child: Text(row.message,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                        )
                )
        );
    }
}