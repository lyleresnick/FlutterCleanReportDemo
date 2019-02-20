import 'package:flutter/material.dart';
import 'TransactionListCell.dart';
import '../../presenter/TransactionListRowViewModel.dart';

class TransactionListHeaderCell extends TransactionListCell {

    final TransactionListHeaderViewModel row;

    TransactionListHeaderCell({@required TransactionListRowViewModel row})
        : assert(row is TransactionListHeaderViewModel, "Expected: header"),
          row = row as TransactionListHeaderViewModel;

  @override
  Widget build(BuildContext context) {
        return Text("header ${row.title}");
    }
}