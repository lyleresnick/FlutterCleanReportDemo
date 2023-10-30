//  Copyright © 2017 Lyle Resnick. All rights reserved.

part of '../../TransactionList.dart';

@visibleForTesting
class FooterCell extends Cell {
  final FooterRowViewModel row;

  FooterCell({required RowViewModel row})
      : assert(row is FooterRowViewModel, "Expected: footer"),
        row = row as FooterRowViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Cell.footerHeight,
        color: backgroundColour(row.odd),
        padding: new EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Total", style: makeTextStyleFooter()),
            Text(row.total, style: makeTextStyleFooter()),
          ],
        ));
  }

  TextStyle makeTextStyleFooter() {
    return TextStyle(
      color: Colors.black,
      fontSize: 16,
    );
  }
}
