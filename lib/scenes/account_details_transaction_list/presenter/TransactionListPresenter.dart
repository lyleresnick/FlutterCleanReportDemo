//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'dart:async';

import 'package:flutter_clean_report_demo/repo/entities/TransactionGroup.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/use_case/TransactionListUseCase.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/use_case/TransactionListUseCaseOutput.dart';
import 'package:flutter_clean_report_demo/scenes/common/Bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';


import 'TransactionListPresenterOutput.dart';
import 'TransactionListRowViewModel.dart';

class TransactionListPresenter extends Bloc {

    final _controller = StreamController<TransactionListPresenterOutput>();
    Stream<TransactionListPresenterOutput> get stream => _controller.stream;

    final _outboundDateFormatter = DateFormat.yMMMMd("en_US");

    var _rows = List<TransactionListRowViewModel>();
    var _odd = false;

    final TransactionListUseCase useCase;

    TransactionListPresenter({@required this.useCase}) {
        useCase.stream
            .listen((event) {
                if (event is PresentInit) {
                    _odd = false;
                    _rows.clear();
                }
                else if (event is PresentHeader) {
                    _rows.add(TransactionListHeaderViewModel(title: event.group.rawValue + " Transactions"));
                }
                else if (event is PresentSubheader) {
                    _odd = !_odd;
                    _rows.add(TransactionListSubheaderViewModel(title: _formatDate(event.date), odd: _odd));
                }
                else if (event is PresentDetail) {
                    _rows.add(TransactionListDetailViewModel(description: event.description, amount: event.amount.toStringAsFixed(2), odd: _odd));
                }
                else if (event is PresentSubfooter) {
                    _rows.add(TransactionListSubfooterViewModel(odd: _odd));
                }
                else if (event is PresentFooter) {
                    _odd = !_odd;
                    _rows.add(TransactionListFooterViewModel(total: event.total.toStringAsFixed(2), odd: _odd));
                }
                else if (event is PresentGrandFooter) {
                    _rows.add(TransactionListGrandFooterViewModel(grandTotal: event.grandTotal.toStringAsFixed(2)));
                }
                else if (event is PresentGroupNotFoundMessage) {
                    _rows.add(TransactionListMessageViewModel(message: "${event.group.rawValue} Transactions are not currently available."));
                }
                else if (event is PresentNoTransactionsMessage) {
                    _rows.add(TransactionListMessageViewModel(message: "There are no ${event.group.rawValue} Transactions in this period" ));
                }
                else if (event is PresentFailure) {
                    _rows.add(TransactionListMessageViewModel(message: "Error: ${event.code}, Message: ${event.description}" ));
                }
                else if (event is PresentNotFoundMessage) {
                    _rows.add(TransactionListHeaderViewModel(title: "All"));
                    _rows.add(TransactionListMessageViewModel(message: "Transactions are not currently available."));
                }
                else if (event is PresentReport) {
                    _controller.sink.add(ShowReport(_rows));
                }
            });

    }

    eventViewReady() {
        useCase.eventViewReady();
    }

    String _formatDate(DateTime date) {
        return _outboundDateFormatter.format(date);
    }

    @override
    void dispose() {
        useCase.dispose();
        _controller.close();
    }

}
