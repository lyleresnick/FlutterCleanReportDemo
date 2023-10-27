//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'dart:async';

import 'package:flutter_clean_report_demo/repo/factory/EntityGateway.dart';
import '../../common/StarterBloc.dart';
import 'TransactionListUseCaseOutput.dart';
import 'TransactionListViewReadyTwoSourceUseCaseTransformer.dart';
// import 'TransactionListViewReadyOneSourceUseCaseTransformer.dart';

class TransactionListUseCase with StarterBloc<TransactionListUseCaseOutput> {

    final EntityGateway entityGateway;
    TransactionListUseCase({required this.entityGateway}) {
        _initialize();
    }

  Future<void> _initialize() async {

      final transformer = TransactionListViewReadyTwoSourceUseCaseTransformer(transactionManager: entityGateway.transactionManager);
     // final transformer = TransactionListViewReadyOneSourceUseCaseTransformer(transactionManager: entityGateway.transactionManager);
     emit(PresentReport(await transformer.transform()));
  }
}
