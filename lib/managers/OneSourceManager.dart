//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../entities/TransactionEntity.dart';

abstract class OneSourceManager {
    List<TransactionEntity> fetchAllTransactions();
}
