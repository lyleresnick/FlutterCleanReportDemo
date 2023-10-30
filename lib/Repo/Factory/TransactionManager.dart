//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_clean_report_demo/Repo/Entities/Transaction.dart';
import 'Result.dart';

enum TransactionException {
    notFound
}

abstract class TransactionManager {
    Future<Result<List<Transaction>>> fetchAllTransactions();
    Future<Result<List<Transaction>>> fetchAuthorizedTransactions();
    Future<Result<List<Transaction>>> fetchPostedTransactions();
}
