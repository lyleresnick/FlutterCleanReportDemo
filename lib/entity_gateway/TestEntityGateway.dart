//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_clean_report_demo/managers/TestTransactionManager.dart';
import 'package:flutter_clean_report_demo/managers/TransactionManager.dart';

import 'EntityGateway.dart';

class TestEntityGateway implements EntityGateway {

    TransactionManager get transactionManager => TestTransactionManager();
}
