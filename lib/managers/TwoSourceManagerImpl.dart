//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../managers/TwoSourceManager.dart';
import '../entities/TransactionEntity.dart';

class TwoSourceManagerImpl implements TwoSourceManager {

    List<TransactionEntity> fetchAuthorizedTransactions() {
        return authorizedData;
    }

    List<TransactionEntity> fetchPostedTransactions() {
        return postedData;
    }
}
