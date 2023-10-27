//  Copyright © 2019 Lyle Resnick. All rights reserved.

sealed class TransactionListRowViewModel {
  double get height;
}

class TransactionListHeaderViewModel extends TransactionListRowViewModel {
  final String title;
  get height => 60;

  TransactionListHeaderViewModel({required this.title});
}

class TransactionListSubheaderViewModel extends TransactionListRowViewModel {
  final String title;
  final bool odd;
  get height => 34;

  TransactionListSubheaderViewModel({required this.title, required this.odd});
}

class TransactionListDetailViewModel extends TransactionListRowViewModel {
  final String description;
  final String amount;
  final bool odd;
  get height => 18;

  TransactionListDetailViewModel(
      {required this.description, required this.amount, required this.odd});
}

class TransactionListSubfooterViewModel extends TransactionListRowViewModel {
  final bool odd;
  get height => 18;

  TransactionListSubfooterViewModel({required this.odd});
}

class TransactionListFooterViewModel extends TransactionListRowViewModel {
  final String total;
  final bool odd;
  get height => 44;

  TransactionListFooterViewModel({required this.total, required this.odd});
}

class TransactionListGrandFooterViewModel extends TransactionListRowViewModel {
  final String grandTotal;
  get height => 60;

  TransactionListGrandFooterViewModel({required this.grandTotal});
}

class TransactionListMessageViewModel extends TransactionListRowViewModel {
  final String message;
  get height => 100;

  TransactionListMessageViewModel({required this.message});
}
