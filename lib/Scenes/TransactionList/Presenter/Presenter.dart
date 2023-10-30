//  Copyright © 2019 Lyle Resnick. All rights reserved.

part of '../TransactionList.dart';

@visibleForTesting
class Presenter with StarterBloc<PresenterOutput> {
  final UseCase _useCase;

  Presenter(this._useCase) {
    _useCase.stream.listen((event) {
      switch (event) {
        case PresentReport(:final model):
          emit(ShowReport(ViewModel.fromPresentationModel(model)));
      }
    });
  }

  @override
  void dispose() {
    _useCase.dispose();
  }
}
