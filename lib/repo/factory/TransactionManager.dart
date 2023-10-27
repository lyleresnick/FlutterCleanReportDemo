//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_clean_report_demo/repo/entities/TransactionEntity.dart';
import 'Result.dart';

enum TransactionException {
    notFound
}

abstract class TransactionManager {
    Future<Result<List<TransactionEntity>>> fetchAllTransactions();
    Future<Result<List<TransactionEntity>>> fetchAuthorizedTransactions();
    Future<Result<List<TransactionEntity>>> fetchPostedTransactions();
}
