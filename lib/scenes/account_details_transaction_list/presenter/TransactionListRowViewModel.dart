
enum CellId {
     header,
     subheader,
     detail,
     subfooter,
     footer,
     grandfooter,
     message
}


abstract class TransactionListRowViewModel {
    CellId get cellId;
    double get height;
}

class TransactionListHeaderViewModel extends TransactionListRowViewModel {

    final String title;
    get cellId => CellId.header;
    get height => 60;

    TransactionListHeaderViewModel({this.title});
}


class TransactionListSubheaderViewModel extends TransactionListRowViewModel {

    final String title;
    final bool odd;
    get cellId => CellId.subheader;
    get height => 34;

    TransactionListSubheaderViewModel({this.title, this.odd});
}

class TransactionListDetailViewModel extends TransactionListRowViewModel {

    final String description;
    final String amount;
    final bool odd;
    get cellId => CellId.detail;
    get height => 18;

    TransactionListDetailViewModel({this.description, this.amount, this.odd});
}

class TransactionListSubfooterViewModel extends TransactionListRowViewModel {

    final bool odd;
    get cellId => CellId.subfooter;
    get height => 18;

    TransactionListSubfooterViewModel({this.odd});
}

class TransactionListFooterViewModel extends TransactionListRowViewModel {

    final String total;
    final bool odd;
    get cellId => CellId.footer;
    get height => 44;

    TransactionListFooterViewModel({this.total, this.odd});
}

class TransactionListGrandFooterViewModel extends TransactionListRowViewModel {

    final String grandTotal;
    get cellId => CellId.grandfooter;
    get height => 60;

    TransactionListGrandFooterViewModel({this.grandTotal});
}

class TransactionListMessageViewModel extends TransactionListRowViewModel {

    final String message;
    get cellId => CellId.message;
    get height => 100;

    TransactionListMessageViewModel({this.message});
}
