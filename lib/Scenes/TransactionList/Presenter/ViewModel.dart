//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TransactionList.dart';

@visibleForTesting
class ViewModel {
  final List<RowViewModel> rows;
  final String? errorMessage;

  ViewModel.fromPresentationModel(PresentationModel model)
      : rows = model.rows.map((row) => row.rowViewModel).toList(),
        errorMessage = model.errorMessage;
}

extension on RowPresentationModel {
  static final _outboundDateFormatter = DateFormat.yMMMMd("en_US");

  RowViewModel get rowViewModel {
    return switch (this) {
      HeaderRowPresentationModel(:final group) =>
        HeaderRowViewModel(title: group.rawValue + " Transactions"),
      SubheaderRowPresentationModel(:final date, :final odd) =>
        SubheaderRowViewModel(title: _formatDate(date), odd: odd),
      DetailRowPresentationModel(:final description, :final amount, :final odd) =>
        DetailViewModel(description: description, amount: amount.toStringAsFixed(2), odd: odd),
      SubfooterRowPresentationModel(:final odd) => SubfooterRowViewModel(odd: odd),
      FooterRowPresentationModel(:final total, :final odd) =>
        FooterRowViewModel(total: total.toStringAsFixed(2), odd: odd),
      GrandFooterRowPresentationModel(:final grandTotal) =>
        GrandFooterRowViewModel(grandTotal: grandTotal.toStringAsFixed(2)),
      NoTransactionsInGroupRowPresentationModel(:final group) =>
        MessageRowViewModel(message: "There are no ${group.rawValue} Transactions."),
      FailureRowPresentationModel(:final code, :final description) =>
        MessageRowViewModel(message: "Error: $code, Message: $description"),
    };
  }

  String _formatDate(DateTime date) {
    return _outboundDateFormatter.format(date);
  }
}

sealed class RowViewModel {}

@visibleForTesting
class HeaderRowViewModel extends RowViewModel {
  final String title;

  HeaderRowViewModel({required this.title});
}

@visibleForTesting
class SubheaderRowViewModel extends RowViewModel {
  final String title;
  final bool odd;

  SubheaderRowViewModel({required this.title, required this.odd});
}

@visibleForTesting
class DetailViewModel extends RowViewModel {
  final String description;
  final String amount;
  final bool odd;

  DetailViewModel({required this.description, required this.amount, required this.odd});
}

@visibleForTesting
class SubfooterRowViewModel extends RowViewModel {
  final bool odd;

  SubfooterRowViewModel({required this.odd});
}

@visibleForTesting
class FooterRowViewModel extends RowViewModel {
  final String total;
  final bool odd;

  FooterRowViewModel({required this.total, required this.odd});
}

@visibleForTesting
class GrandFooterRowViewModel extends RowViewModel {
  final String grandTotal;

  GrandFooterRowViewModel({required this.grandTotal});
}

@visibleForTesting
class MessageRowViewModel extends RowViewModel {
  final String message;

  MessageRowViewModel({required this.message});
}
