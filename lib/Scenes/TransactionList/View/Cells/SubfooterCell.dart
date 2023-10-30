//  Copyright © 2017 Lyle Resnick. All rights reserved.

part of '../../TransactionList.dart';

@visibleForTesting
class SubfooterCell extends Cell {
  final SubfooterRowViewModel row;

  SubfooterCell({required RowViewModel row})
      : assert(row is SubfooterRowViewModel, "Expected: subfooter"),
        row = row as SubfooterRowViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Cell.subfooterHeight,
      color: backgroundColour(row.odd),
    );
  }
}
