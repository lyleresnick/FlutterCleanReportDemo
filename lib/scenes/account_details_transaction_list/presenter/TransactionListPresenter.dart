//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';

import '../../../entities/TransactionGroup.dart';
import '../use_case/TransactionListUseCase.dart';
import '../use_case/TransactionListUseCaseOutput.dart';

import 'TransactionListPresenterOutput.dart';
import 'TransactionListRowViewModel.dart';

class TransactionListPresenter implements TransactionListUseCaseOutput {

    TransactionListPresenterOutput output;

    final _outboundDateFormatter = DateFormat.yMMMMd("en_US");

    var _rows = List<TransactionListRowViewModel>();
    var _odd = false;

    final TransactionListUseCase useCase;

    TransactionListPresenter({@required this.useCase});

    eventViewReady() {
        useCase.eventViewReady();
    }

    CellId cellId(int index) => _rows[ index ].cellId;
    double cellHeight(int index) => _rows[ index ].height;
    int get rowCount => _rows.length;
    TransactionListRowViewModel row(int index) => _rows[index];

// TransactionListUseCaseOutput
// TransactionListViewReadyUseCaseOutput

    @override void presentInit() {
        _odd = false;
        _rows.clear();
    }

    @override void presentReport() {
        output.showReport();
    }

    @override void presentHeader({TransactionGroup group}) {
        _rows.add(TransactionListHeaderViewModel(title: transactionGroupToString(group) + " Transactions"));
    }

    @override void presentSubheader({DateTime date}) {
    
        _odd = !_odd;
        _rows.add(TransactionListSubheaderViewModel(title: _formatDate(date), odd: _odd));
    }

    String _formatDate(DateTime date) {
        return _outboundDateFormatter.format(date);
    }

    @override void presentDetail({String description, double amount}) {

        _rows.add(TransactionListDetailViewModel(description: description, amount: amount.toStringAsFixed(2), odd: _odd));
    }

    @override void presentSubfooter() {
        _rows.add(TransactionListSubfooterViewModel(odd: _odd));
    }

    @override void presentFooter({double total}) {

        _odd = !_odd;
        _rows.add(TransactionListFooterViewModel(total: total.toStringAsFixed(2), odd: _odd));
    }

    @override void presentGrandFooter({double grandTotal}) {

        _rows.add(TransactionListGrandFooterViewModel(grandTotal: grandTotal.toStringAsFixed(2)));
    }

    @override void presentGroupNotFoundMessage({TransactionGroup group}) {
    
        _rows.add(TransactionListMessageViewModel(message: "${transactionGroupToString(group)} Transactions are not currently available."));
    }

    @override void presentNoTransactionsMessage({TransactionGroup group}) {

        _rows.add(TransactionListMessageViewModel(message: "There are no ${transactionGroupToString(group)} Transactions in this period" ));
    }

    @override void presentNotFoundMessage() {

        _rows.add(TransactionListHeaderViewModel(title: "All"));
        _rows.add(TransactionListMessageViewModel(message: "Transactions are not currently available."));
    }
}
