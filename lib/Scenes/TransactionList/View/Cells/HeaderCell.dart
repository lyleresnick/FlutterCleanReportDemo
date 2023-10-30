//  Copyright © 2017 Lyle Resnick. All rights reserved.

part of '../../TransactionList.dart';

@visibleForTesting
class HeaderCell extends Cell {
  final HeaderRowViewModel row;

  HeaderCell({required RowViewModel row})
      : assert(row is HeaderRowViewModel, "Expected: header"),
        row = row as HeaderRowViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Cell.headerHeight,
        color: brandColor,
        padding: new EdgeInsets.only(left: 20.0),
        alignment: Alignment(-1, 0),
        child: Text(row.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            )));
  }
}
