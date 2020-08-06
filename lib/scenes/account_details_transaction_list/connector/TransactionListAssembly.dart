//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../../../entity_gateway/EntityGateway.dart';
import '../../../entity_gateway/EntityGatewayImpl.dart';
import '../view/TransactionListScene.dart';
import '../presenter/TransactionListPresenter.dart';
import '../use_case/TransactionListUseCase.dart';

class TransactionListAssembly {

    final TransactionListScene scene;
    final TransactionListPresenter presenter;
    final TransactionListUseCase useCase;

    TransactionListAssembly({this.scene, this.useCase, this.presenter});

    factory TransactionListAssembly.assembled({EntityGateway entityGateway}) {
        if (entityGateway == null ) {
            entityGateway = EntityGatewayImpl();
        }

        final useCase = TransactionListUseCase(entityGateway: entityGateway);
        final presenter = TransactionListPresenter(useCase: useCase);
        final scene = TransactionListScene(presenter: presenter);
        useCase.output = presenter;

        return TransactionListAssembly(scene: scene, useCase: useCase, presenter: presenter);
    }
}