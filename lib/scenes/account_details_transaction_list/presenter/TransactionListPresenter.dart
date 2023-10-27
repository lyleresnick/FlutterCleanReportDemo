//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_clean_report_demo/repo/entities/TransactionGroup.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/use_case/TransactionListUseCase.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/use_case/TransactionListUseCaseOutput.dart';
import 'package:intl/intl.dart';

import '../../common/StarterBloc.dart';
import '../use_case/TransactionListPresentationModel.dart';
import 'TransactionListPresenterOutput.dart';
import 'TransactionListViewModel.dart';

class TransactionListPresenter with StarterBloc<TransactionListPresenterOutput> {
  final TransactionListUseCase useCase;

  TransactionListPresenter({required this.useCase}) {
    useCase.stream.listen((event) {
      switch (event) {
        case PresentReport(:final rows):
          final newRows = rows.map((row) => row.rowViewModel).toList();
          emit(ShowReport(newRows));
      }
    });
  }

  @override
  void dispose() {
    useCase.dispose();
  }
}

extension on TransactionListRowPresentationModel {
  static final _outboundDateFormatter = DateFormat.yMMMMd("en_US");

  TransactionListRowViewModel get rowViewModel {
    return switch (this) {
      TransactionListHeaderRowPresentationModel(:final group) =>
        TransactionListHeaderViewModel(title: group.rawValue + " Transactions"),
      TransactionListSubheaderRowPresentationModel(:final date, :final odd) =>
        TransactionListSubheaderViewModel(title: _formatDate(date), odd: odd),
      TransactionListDetailRowPresentationModel(:final description, :final amount, :final odd) =>
        TransactionListDetailViewModel(
            description: description, amount: amount.toStringAsFixed(2), odd: odd),
      TransactionListSubfooterRowPresentationModel(:final odd) =>
        TransactionListSubfooterViewModel(odd: odd),
      TransactionListFooterRowPresentationModel(:final total, :final odd) =>
        TransactionListFooterViewModel(total: total.toStringAsFixed(2), odd: odd),
      TransactionListGrandFooterRowPresentationModel(:final grandTotal) =>
        TransactionListGrandFooterViewModel(grandTotal: grandTotal.toStringAsFixed(2)),
      TransactionListNoTransactionsInGroupRowPresentationModel(:final group) =>
        TransactionListMessageViewModel(message: "There are no ${group.rawValue} Transactions."),
      TransactionListFailureRowPresentationModel(:final code, :final description) =>
        TransactionListMessageViewModel(message: "Error: $code, Message: $description"),
    };
  }

  String _formatDate(DateTime date) {
    return _outboundDateFormatter.format(date);
  }
}
