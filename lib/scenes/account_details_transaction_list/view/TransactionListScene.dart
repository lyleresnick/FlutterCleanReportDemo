//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/assembly/TransactionListAssembly.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/presenter/TransactionListPresenter.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/presenter/TransactionListPresenterOutput.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/view/cells/TransactionListCell.dart';
import 'package:flutter_clean_report_demo/scenes/common/BlocProvider.dart';
import 'package:flutter_clean_report_demo/scenes/common/colors.dart';

import '../presenter/TransactionListViewModel.dart';
import 'cells/TransactionListDetailCell.dart';
import 'cells/TransactionListFooterCell.dart';
import 'cells/TransactionListGrandFooterCell.dart';
import 'cells/TransactionListHeaderCell.dart';
import 'cells/TransactionListMessageCell.dart';
import 'cells/TransactionListSubfooterCell.dart';
import 'cells/TransactionListSubheaderCell.dart';

class TransactionListScene extends StatelessWidget {
  final TransactionListPresenter presenter;

  TransactionListScene({required this.presenter});

  factory TransactionListScene.assembled() {
    return TransactionListAssembly().scene;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transaction List'),
          backgroundColor: brandColor,
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: BlocProvider<TransactionListPresenter>(
          bloc: presenter,
          child: SafeArea(
              child: StreamBuilder<TransactionListPresenterOutput>(
                  stream: presenter.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading ...");
                    }
                    final data = snapshot.data;
                    if (data is ShowReport)
                      return ListView.builder(
                          itemCount: data.rows.length,
                          itemBuilder: (context, index) {
                            return data.rows[index]._cell;
                          });
                    else
                      return Text("Error");
                  })),
        ));
  }
}

extension on TransactionListRowViewModel {
  TransactionListCell get _cell {
    return switch (this) {
      TransactionListHeaderViewModel() => TransactionListHeaderCell(row: this),
      TransactionListSubheaderViewModel() =>
        TransactionListSubheaderCell(row: this),
      TransactionListDetailViewModel() => TransactionListDetailCell(row: this),
      TransactionListSubfooterViewModel() =>
        TransactionListSubfooterCell(row: this),
      TransactionListFooterViewModel() => TransactionListFooterCell(row: this),
      TransactionListGrandFooterViewModel() =>
        TransactionListGrandFooterCell(row: this),
      TransactionListMessageViewModel() =>
        TransactionListMessageCell(row: this),
    };
  }
}
