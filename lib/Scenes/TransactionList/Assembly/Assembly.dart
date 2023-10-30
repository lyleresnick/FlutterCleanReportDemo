//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TransactionList.dart';

class Assembly {
  final Scene scene;
  Assembly._({required this.scene});

  factory Assembly() {
    // final useCase = SingleSourceUseCase(EntityGateway.entityGateway);
    final useCase = TwoSourceUseCase(EntityGateway.entityGateway);
    final presenter = Presenter(useCase);
    final scene = Scene(presenter);

    return Assembly._(scene: scene);
  }
}
