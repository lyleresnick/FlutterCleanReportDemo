//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TransactionList.dart';

sealed class RowPresentationModel {}

@visibleForTesting
class HeaderRowPresentationModel extends RowPresentationModel {
  final TransactionGroup group;
  HeaderRowPresentationModel(this.group);
}

@visibleForTesting
class SubheaderRowPresentationModel extends RowPresentationModel {
  final DateTime date;
  final bool odd;
  SubheaderRowPresentationModel(this.date, this.odd);
}

@visibleForTesting
class DetailRowPresentationModel extends RowPresentationModel {
  final String description;
  final double amount;
  final bool odd;
  DetailRowPresentationModel(this.description, this.amount, this.odd);
}

@visibleForTesting
class SubfooterRowPresentationModel extends RowPresentationModel {
  final bool odd;
  SubfooterRowPresentationModel(this.odd);
}

@visibleForTesting
class FooterRowPresentationModel extends RowPresentationModel {
  final double total;
  final bool odd;
  FooterRowPresentationModel(this.total, this.odd);
}

@visibleForTesting
class GrandFooterRowPresentationModel extends RowPresentationModel {
  final double grandTotal;
  GrandFooterRowPresentationModel(this.grandTotal);
}

@visibleForTesting
class NoTransactionsInGroupRowPresentationModel extends RowPresentationModel {
  final TransactionGroup group;
  NoTransactionsInGroupRowPresentationModel(this.group);
}

@visibleForTesting
class FailureRowPresentationModel extends RowPresentationModel {
  final int code;
  final String description;
  FailureRowPresentationModel(this.code, this.description);
}
