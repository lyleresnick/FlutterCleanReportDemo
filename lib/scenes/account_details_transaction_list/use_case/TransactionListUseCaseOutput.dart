//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'TransactionListPresentationModel.dart';

abstract class TransactionListUseCaseOutput {}

class PresentReport extends TransactionListUseCaseOutput {
  final List<TransactionListRowPresentationModel> rows;
  PresentReport(this.rows);
}
