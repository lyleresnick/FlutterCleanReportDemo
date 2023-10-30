
import 'package:flutter_clean_report_demo/Repo/Factory/EntityGateway.dart';
import 'package:flutter_clean_report_demo/Repo/Factory/TransactionManager.dart';

import 'NetworkClient.dart';
import 'NetworkTransactionManager.dart';

class NetworkEntityGateway extends EntityGateway {
  TransactionManager get transactionManager => NetworkTransactionManager(NetworkClient());
}
