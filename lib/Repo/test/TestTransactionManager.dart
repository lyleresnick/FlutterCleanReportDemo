//  Copyright © 2019 Lyle Resnick. All rights reserved.


import 'dart:async';

import 'package:flutter_clean_report_demo/Repo/Entities/Transaction.dart';
import 'package:flutter_clean_report_demo/Repo/Factory/Result.dart';
import 'package:flutter_clean_report_demo/Repo/Factory/TransactionManager.dart';

class TestTransactionManager implements TransactionManager {

    Future<Result<List<Transaction>>> fetchAllTransactions() async {
        return SuccessResult(data: allData);
    }

    Future<Result<List<Transaction>>> fetchAuthorizedTransactions() async  {
        return SuccessResult(data: authorizedData);
    }

    Future<Result<List<Transaction>>> fetchPostedTransactions() async {
        return SuccessResult(data: postedData);
    }


}
