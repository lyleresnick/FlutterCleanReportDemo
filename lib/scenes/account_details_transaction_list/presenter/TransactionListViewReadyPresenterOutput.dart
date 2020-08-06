//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../presenter/TransactionListRowViewModel.dart';

abstract class TransactionListViewReadyPresenterOutput {
     showReport(List<TransactionListRowViewModel> rows);
}
