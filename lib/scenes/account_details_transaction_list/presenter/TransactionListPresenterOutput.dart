//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/presenter/TransactionListRowViewModel.dart';

abstract class TransactionListPresenterOutput {}
// ViewReady
class ShowReport extends TransactionListPresenterOutput { final List<TransactionListRowViewModel> rows; ShowReport(this.rows); }
