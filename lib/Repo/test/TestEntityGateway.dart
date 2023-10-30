//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_clean_report_demo/Repo/Factory/EntityGateway.dart';
import 'package:flutter_clean_report_demo/Repo/Factory/TransactionManager.dart';

import 'TestTransactionManager.dart';

class TestEntityGateway extends EntityGateway {

    TransactionManager get transactionManager => TestTransactionManager();
}
