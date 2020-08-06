//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../entities/TransactionEntity.dart';

abstract class TwoSourceManager {
    List<TransactionEntity> fetchAuthorizedTransactions();
    List<TransactionEntity> fetchPostedTransactions();
}
