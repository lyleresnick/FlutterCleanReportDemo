
import 'package:flutter_clean_report_demo/repo/factory/EntityGateway.dart';
import 'package:flutter_clean_report_demo/repo/factory/TransactionManager.dart';

import 'NetworkClient.dart';
import 'NetworkTransactionManager.dart';

class NetworkEntityGateway extends EntityGateway {
  TransactionManager get transactionManager => NetworkTransactionManager(NetworkClient());
}
