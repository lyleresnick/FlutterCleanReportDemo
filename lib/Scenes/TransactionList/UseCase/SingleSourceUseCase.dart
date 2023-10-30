//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TransactionList.dart';

@visibleForTesting
class SingleSourceUseCase extends UseCase {
  final EntityGateway _entityGateway;
  SingleSourceUseCase(this._entityGateway) {
    _initialize();
  }

  Future<void> _initialize() async {
    final result = await _entityGateway.transactionManager.fetchAllTransactions();
    switch (result) {
      case SuccessResult(:final data):
        emit(PresentReport(PresentationModel.fromOneSource(allTransactions: data!)));
      case FailureResult(:final code, :final description):
        emit(PresentReport(PresentationModel.fromOneSource(
            allTransactions: [], errorMessage: "${code!} authorized: ${description!}")));
    }
  }
}
