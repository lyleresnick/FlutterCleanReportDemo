//  Copyright © 2017 Lyle Resnick. All rights reserved.

part of '../../TransactionList.dart';

@visibleForTesting
class SubheaderCell extends Cell {
  final SubheaderRowViewModel row;

  SubheaderCell({required RowViewModel row})
      : assert(row is SubheaderRowViewModel, "Expected: subheader"),
        row = row as SubheaderRowViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Cell.subheaderHeight,
        color: backgroundColour(row.odd),
        padding: new EdgeInsets.only(left: 20.0),
        alignment: Alignment(-1, .5),
        child: Text(row.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 11,
            )));
  }
}
