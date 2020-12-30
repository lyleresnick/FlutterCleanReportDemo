//  Copyright © 2019 Lyle Resnick. All rights reserved.


import 'dart:async';

import 'package:flutter_clean_report_demo/repo/entities/TransactionEntity.dart';
import 'package:flutter_clean_report_demo/repo/factory/Result.dart';
import 'package:flutter_clean_report_demo/repo/factory/TransactionManager.dart';

class TestTransactionManager implements TransactionManager {

    Future<Result<List<TransactionEntity>, TransactionException>> fetchAllTransactions() async {
        return SuccessResult(data: allData);
        // return SemanticErrorResult(reason: TransactionException.notFound);
    }

    Future<Result<List<TransactionEntity>, TransactionException>> fetchAuthorizedTransactions() async  {
        return SuccessResult(data: authorizedData);
        // return SemanticErrorResult(reason: TransactionException.notFound);
    }

    Future<Result<List<TransactionEntity>, TransactionException>> fetchPostedTransactions() async {
        return SuccessResult(data: postedData);
    }


}
