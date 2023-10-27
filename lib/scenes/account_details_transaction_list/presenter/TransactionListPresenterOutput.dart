//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/presenter/TransactionListViewModel.dart';

abstract class TransactionListPresenterOutput {}
class ShowReport extends TransactionListPresenterOutput { final List<TransactionListRowViewModel> rows; ShowReport(this.rows); }
