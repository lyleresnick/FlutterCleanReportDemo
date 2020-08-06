//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../managers/OneSourceManager.dart';
import '../entities/TransactionEntity.dart';

class OneSourceManagerImpl implements OneSourceManager {

    List<TransactionEntity> fetchAllTransactions() {
        return allData;
    }

}
