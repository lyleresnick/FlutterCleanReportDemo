//  Copyright © 2017 Lyle Resnick. All rights reserved.

part of '../../TransactionList.dart';

@visibleForTesting
class MessageCell extends Cell {
  final MessageRowViewModel row;

  MessageCell({required RowViewModel row})
      : assert(row is MessageRowViewModel, "Expected: message"),
        row = row as MessageRowViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Cell.messageHeight,
        color: Colors.white,
        padding: new EdgeInsets.only(left: 20.0),
        alignment: Alignment(-1, 0),
        child: Text(row.message,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
            )));
  }
}
