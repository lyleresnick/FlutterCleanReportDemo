//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_clean_report_demo/repo/factory/EntityGateway.dart';
import 'package:flutter_clean_report_demo/repo/factory/TransactionManager.dart';

import 'TestTransactionManager.dart';

class TestEntityGateway implements EntityGateway {

    TransactionManager get transactionManager => TestTransactionManager();
}
