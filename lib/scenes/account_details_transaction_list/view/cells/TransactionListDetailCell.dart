import 'package:flutter/material.dart';
import 'TransactionListCell.dart';
import '../../presenter/TransactionListViewModel.dart';

class TransactionListDetailCell extends TransactionListCell {
  final TransactionListDetailViewModel row;

  TransactionListDetailCell({required TransactionListRowViewModel row})
      : assert(row is TransactionListDetailViewModel, "Expected: detail"),
        row = row as TransactionListDetailViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: row.height,
        color: backgroundColour(row.odd),
        padding: new EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(row.description, style: makeTextStyleDetail()),
            Text(row.amount, style: makeTextStyleDetail()),
          ],
        ));
  }

  TextStyle makeTextStyleDetail() {
    return TextStyle(
      color: Colors.black,
      fontSize: 13,
    );
  }
}
