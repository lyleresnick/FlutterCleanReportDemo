//  Copyright © 2017 Lyle Resnick. All rights reserved.

part of '../../TransactionList.dart';

@visibleForTesting
class DetailCell extends Cell {
  final DetailViewModel row;

  DetailCell({required RowViewModel row})
      : assert(row is DetailViewModel, "Expected: detail"),
        row = row as DetailViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Cell.detailHeight,
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
