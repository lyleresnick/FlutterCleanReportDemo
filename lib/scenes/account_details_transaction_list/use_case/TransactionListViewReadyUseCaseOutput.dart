import 'package:flutter_clean_report_demo/entities/TransactionGroup.dart';

abstract class TransactionListViewReadyUseCaseOutput {

    void presentInit();
    void presentHeader({TransactionGroup group});
    void presentSubheader({DateTime date});
    void presentDetail({String description, double amount});
    void presentSubfooter();
    void presentFooter({double total});
    void presentGrandFooter({double grandTotal});
    void presentGroupNotFoundMessage({TransactionGroup group});
    void presentNoTransactionsMessage({TransactionGroup group});
    void presentNotFoundMessage();
    void presentReport();
}