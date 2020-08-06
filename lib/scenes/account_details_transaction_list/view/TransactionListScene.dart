//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import '../../common/colors.dart';
import '../presenter/TransactionListPresenter.dart';
import '../presenter/TransactionListPresenterOutput.dart';
import '../connector/TransactionListAssembly.dart';
import 'cells/TransactionListCell.dart';
import '../presenter/TransactionListRowViewModel.dart';



class TransactionListScene extends StatefulWidget {
  final TransactionListPresenter presenter;

  TransactionListScene({@required this.presenter});

  @override
  State<StatefulWidget> createState() => TransactionListSceneState();

  factory TransactionListScene.assembled() {
    return TransactionListAssembly.assembled().scene;
  }
}

class TransactionListSceneState extends State<TransactionListScene> implements TransactionListPresenterOutput {
  TransactionListPresenter presenter;

  var _rows = List<TransactionListRowViewModel>();

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
          itemCount: _rows.length,
          itemBuilder: (context, index) {
            return TransactionListCell.from(row: _rows[index] );
          }),
    );
  }

// TransactionListPresenterOutput
// TransactionListViewReadyPresenterOutput

  showReport(List<TransactionListRowViewModel> rows) {
    setState(() {
      _rows = rows;
    });
  }
}
