//  Copyright © 2019 Lyle Resnick. All rights reserved.


import 'package:flutter_clean_report_demo/entities/TransactionEntity.dart';

abstract class TransactionManager {
    List<TransactionEntity> fetchAllTransactions();
    List<TransactionEntity> fetchAuthorizedTransactions();
    List<TransactionEntity> fetchPostedTransactions();
}
