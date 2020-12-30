//  Copyright © 2019 Lyle Resnick. All rights reserved.


import 'package:flutter_clean_report_demo/repo/network/NetworkEntityGateway.dart';
import 'package:flutter_clean_report_demo/repo/test/TestEntityGateway.dart';

import 'TransactionManager.dart';

enum Implementation {
    test,
    networked
}


abstract class EntityGateway {
    TransactionManager get transactionManager;

    static final gatewayImplementation = Implementation.networked;

    static EntityGateway _entityGateway;

    static get entityGateway {
        if(_entityGateway != null) return _entityGateway;
        switch(gatewayImplementation) {
            case Implementation.test:
                _entityGateway = TestEntityGateway();
                break;
            case Implementation.networked:
                _entityGateway =  NetworkEntityGateway();
                break;
        }
        return _entityGateway;
    }

}