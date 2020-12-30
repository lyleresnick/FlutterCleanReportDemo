//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_clean_report_demo/repo/factory/EntityGateway.dart';
import 'package:flutter_clean_report_demo/scenes/common/Bloc.dart';
import 'TransactionListUseCaseOutput.dart';
// import 'TransactionListViewReadyTwoSourceUseCaseTransformer.dart';
import 'TransactionListViewReadyOneSourceUseCaseTransformer.dart';


class TransactionListUseCase extends Bloc {

    final _controller = StreamController<TransactionListUseCaseOutput>();
    Stream<TransactionListUseCaseOutput> get stream => _controller.stream;

    final EntityGateway entityGateway;
    TransactionListUseCase({@required this.entityGateway});

  void eventViewReady() {

      // final transformer = TransactionListViewReadyTwoSourceUseCaseTransformer(transactionManager: entityGateway.transactionManager);
     final transformer = TransactionListViewReadyOneSourceUseCaseTransformer(transactionManager: entityGateway.transactionManager);
      transformer.transform(output:  _controller.sink);

  }

    @override
    void dispose() {
        _controller.close();
    }


}
