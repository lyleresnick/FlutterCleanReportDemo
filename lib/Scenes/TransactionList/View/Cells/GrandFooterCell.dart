//  Copyright © 2017 Lyle Resnick. All rights reserved.

part of '../../TransactionList.dart';

@visibleForTesting
class GrandFooterCell extends Cell {
  final GrandFooterRowViewModel row;

  GrandFooterCell({required RowViewModel row})
      : assert(row is GrandFooterRowViewModel,
            "Expected: grandfooter"),
        row = row as GrandFooterRowViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Cell.grandFooterHeight,
        color: brandColor,
        padding: new EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Grand Total", style: makeTextStyleGrandFooter()),
            Text(row.grandTotal, style: makeTextStyleGrandFooter()),
          ],
        ));
  }

  TextStyle makeTextStyleGrandFooter() {
    return TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
  }
}
