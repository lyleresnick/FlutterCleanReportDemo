//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:flutter_clean_report_demo/entities/TransactionGroup.dart';
import 'TransactionListPresenterOutput.dart';
import '../use_case/TransactionListUseCase.dart';
import '../use_case/TransactionListUseCaseOutput.dart';

import 'TransactionListRowViewModel.dart';
import 'package:intl/intl.dart';


class TransactionListPresenter implements TransactionListUseCaseOutput {

    TransactionListPresenterOutput output;

    final _outboundDateFormatter = DateFormat.yMMMMd("en_US");

    var rows = List<TransactionListRowViewModel>();
    var odd = false;

    final TransactionListUseCase useCase;

    TransactionListPresenter({this.useCase});



    eventViewReady() {
        useCase.eventViewReady();
    }

    CellId cellId(int index) => rows[ index ].cellId;
    int cellHeight(int index) => rows[ index ].height;
    int get rowCount => rows.length;
    TransactionListRowViewModel row(int index) => rows[index];

// TransactionListUseCaseOutput
// TransactionListViewReadyUseCaseOutput


    @override void presentInit() {
        odd = false;
        rows.clear();
    }

    @override void presentReport() {
        output.showReport();
    }

    @override void presentHeader({TransactionGroup group}) {
        rows.add(TransactionListHeaderViewModel(title: transactionGroupToString(group) + " Transactions"));
    }

    @override void presentSubheader({DateTime date}) {
    
        odd = !odd;
        rows.add(TransactionListSubheaderViewModel(title: _formatDate(date), odd: odd));
    }

    String _formatDate(DateTime date) {
        return _outboundDateFormatter.format(date);
    }

    @override void presentDetail({String description, double amount}) {

        rows.add(TransactionListDetailViewModel(description: description, amount: amount.toString(), odd: odd));
    }

    @override void presentSubfooter() {
        rows.add(TransactionListSubfooterViewModel(odd: odd));
    }

    @override void presentFooter({double total}) {

        odd = !odd;
        rows.add(TransactionListFooterViewModel(total: total.toString(), odd: odd));
    }

    @override void presentGrandFooter({double grandTotal}) {

        rows.add(TransactionListGrandFooterViewModel(grandTotal: grandTotal.toString()));
    }

    @override void presentGroupNotFoundMessage({TransactionGroup group}) {
    
        rows.add(TransactionListMessageViewModel(message: "${transactionGroupToString(group).toString()} Transactions are not currently available."));
    }

    @override void presentNoTransactionsMessage({TransactionGroup group}) {

        rows.add(TransactionListMessageViewModel(message: "There are no ${transactionGroupToString(group).toString()} Transactions in this period" ));
    }

    @override void presentNotFoundMessage() {

        rows.add(TransactionListHeaderViewModel(title: "All"));
        rows.add(TransactionListMessageViewModel(message: "Transactions are not currently available."));
    }
}
