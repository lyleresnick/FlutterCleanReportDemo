//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter_clean_report_demo/Repo/Network/NetworkEntityGateway.dart';
import 'package:flutter_clean_report_demo/Repo/Test/TestEntityGateway.dart';

import 'TransactionManager.dart';

enum _Implementation { test, network }

abstract class EntityGateway {
  TransactionManager get transactionManager;

  static final gatewayImplementation = _Implementation.network;

  static EntityGateway get entityGateway {
    return switch (gatewayImplementation) {
      _Implementation.test => TestEntityGateway(),
      _Implementation.network => NetworkEntityGateway()
    };
  }
}
