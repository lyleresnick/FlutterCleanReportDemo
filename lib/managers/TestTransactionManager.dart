//  Copyright © 2019 Lyle Resnick. All rights reserved.


import 'package:flutter_clean_report_demo/entities/TransactionEntity.dart';

import 'TransactionManager.dart';

class TestTransactionManager implements TransactionManager {

    List<TransactionEntity> fetchAllTransactions() {
        return allData;
    }

    List<TransactionEntity> fetchAuthorizedTransactions() {
        return authorizedData;
    }

    List<TransactionEntity> fetchPostedTransactions() {
        return postedData;
    }


}
