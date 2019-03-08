//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import '../../common/colors.dart';
import '../presenter/TransactionListPresenter.dart';
import '../presenter/TransactionListPresenterOutput.dart';
import '../connector/TransactionListAssembly.dart';
import 'cells/TransactionListCell.dart';


class TransactionListScene extends StatefulWidget {
  final TransactionListPresenter presenter;

  TransactionListScene({@required this.presenter});

  @override
  State<StatefulWidget> createState() => TransactionListSceneState();

  factory TransactionListScene.assembled() {
    return TransactionListAssembly.assembled().scene;
  }
}

class TransactionListSceneState extends State<TransactionListScene>
    implements TransactionListPresenterOutput {
  TransactionListPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = widget.presenter;
    presenter.output = this;

    presenter.eventViewReady();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction List'),
        backgroundColor: brandColor,
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
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
