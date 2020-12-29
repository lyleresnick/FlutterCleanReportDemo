//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'package:flutter/foundation.dart';
import 'package:flutter_clean_report_demo/entity_gateway/TestEntityGateway.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/presenter/TransactionListPresenter.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/use_case/TransactionListUseCase.dart';
import 'package:flutter_clean_report_demo/scenes/account_details_transaction_list/view/TransactionListScene.dart';


class TransactionListAssembly {

    final TransactionListScene scene;
    TransactionListAssembly._({@required this.scene});

    factory TransactionListAssembly({ entityGateway}) {
        if (entityGateway == null ) {
            entityGateway = TestEntityGateway();
        }
        final useCase = TransactionListUseCase(entityGateway: entityGateway);
        final presenter = TransactionListPresenter(useCase: useCase);
        final scene = TransactionListScene(presenter: presenter);

        return TransactionListAssembly._(scene: scene);
    }
}