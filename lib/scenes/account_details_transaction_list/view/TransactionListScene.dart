//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:flutter/material.dart';
import '../../common/colors.dart';
import '../presenter/TransactionListPresenter.dart';
import '../presenter/TransactionListPresenterOutput.dart';
import '../connector/TransactionListAssembler.dart';
import 'cells/TransactionListCell.dart';


class TransactionListScene extends StatefulWidget {
  final TransactionListPresenter presenter;

  TransactionListScene({@required this.presenter});

  @override
  State<StatefulWidget> createState() {
    final state = TransactionListSceneState();
    presenter.output = state;
    return state;
  }

  factory TransactionListScene.assembly() {
    return TransactionListAssembler.makeScene().scene;
  }
}

class TransactionListSceneState extends State<TransactionListScene>
    implements TransactionListPresenterOutput {
  TransactionListPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = widget.presenter;
    presenter.eventViewReady();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction List'),
        backgroundColor: brandColor,
      ),
      body: ListView.builder(
          itemCount: presenter.rowCount,
          itemBuilder: (context, index) {
            return TransactionListCell.from(cellId: presenter.cellId(index),row:  presenter.row(index) );
          }),
    );
  }

// TransactionListPresenterOutput
// TransactionListViewReadyPresenterOutput

  showReport() {
    setState(() {});
  }
}
