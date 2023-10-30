//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TransactionList.dart';

@visibleForTesting
class TwoSourceUseCase extends UseCase {
  final EntityGateway _entityGateway;
  TwoSourceUseCase(this._entityGateway) {
    _initialize();
  }

  Future<void> _initialize() async {
    List<Transaction> authorizedTransactions = [];
    List<Transaction> postedTransactions = [];
    String? errorMessage;

    final authorizedResult = await _entityGateway.transactionManager.fetchAuthorizedTransactions();
    switch (authorizedResult) {
      case SuccessResult(:final data):
        authorizedTransactions = data!;
      case FailureResult(:final code, :final description):
        errorMessage = "${code!} authorized: ${description!}";
    }
    if (errorMessage != null) {
      emit(PresentReport(PresentationModel.fromTwoSources(
          authorizedTransactions: [], postedTransactions: [], errorMessage: errorMessage)));
      return;
    }
    final postedResult = await _entityGateway.transactionManager.fetchPostedTransactions();
    switch (postedResult) {
      case SuccessResult(:final data):
        postedTransactions = data!;
      case FailureResult(:final code, :final description):
        errorMessage = "${code!} posted: ${description!}";
    }
    if (errorMessage != null) {
      emit(PresentReport(PresentationModel.fromTwoSources(
          authorizedTransactions: [], postedTransactions: [], errorMessage: errorMessage)));
      return;
    }
    emit(PresentReport(PresentationModel.fromTwoSources(
        authorizedTransactions: authorizedTransactions, postedTransactions: postedTransactions)));
  }
}
