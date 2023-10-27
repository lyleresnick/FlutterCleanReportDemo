import 'package:flutter_clean_report_demo/repo/entities/TransactionGroup.dart';

enum ErrorType {
  notFound,
}

sealed class TransactionListRowPresentationModel {}

class TransactionListHeaderRowPresentationModel extends TransactionListRowPresentationModel {
  final TransactionGroup group;
  TransactionListHeaderRowPresentationModel(this.group);
}

class TransactionListSubheaderRowPresentationModel extends TransactionListRowPresentationModel {
  final DateTime date;
  final bool odd;
  TransactionListSubheaderRowPresentationModel(this.date, this.odd);
}

class TransactionListDetailRowPresentationModel extends TransactionListRowPresentationModel {
  final String description;
  final double amount;
  final bool odd;
  TransactionListDetailRowPresentationModel(this.description, this.amount, this.odd);
}

class TransactionListSubfooterRowPresentationModel extends TransactionListRowPresentationModel {
  final bool odd;
  TransactionListSubfooterRowPresentationModel(this.odd);
}

class TransactionListFooterRowPresentationModel extends TransactionListRowPresentationModel {
  final double total;
  final bool odd;
  TransactionListFooterRowPresentationModel(this.total, this.odd);
}

class TransactionListGrandFooterRowPresentationModel extends TransactionListRowPresentationModel {
  final double grandTotal;
  TransactionListGrandFooterRowPresentationModel(this.grandTotal);
}

class TransactionListNoTransactionsInGroupRowPresentationModel extends TransactionListRowPresentationModel {
  final TransactionGroup group;
  TransactionListNoTransactionsInGroupRowPresentationModel(this.group);
}

class TransactionListFailureRowPresentationModel extends TransactionListRowPresentationModel {
  final int code;
  final String description;
  TransactionListFailureRowPresentationModel(this.code, this.description);
}
