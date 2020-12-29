//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_clean_report_demo/entity_gateway/EntityGateway.dart';
import 'package:flutter_clean_report_demo/scenes/common/Bloc.dart';
import 'TransactionListUseCaseOutput.dart';
import 'TransactionListViewReadyTwoSourceUseCaseTransformer.dart';
//import 'TransactionListViewReadyOneSourceUseCaseTransformer.dart';


class TransactionListUseCase extends Bloc {

    final _controller = StreamController<TransactionListUseCaseOutput>();
    Stream<TransactionListUseCaseOutput> get stream => _controller.stream;

    final EntityGateway _entityGateway;
    TransactionListUseCase({@required EntityGateway entityGateway}) : _entityGateway = entityGateway;

  void eventViewReady() {

      final transformer = TransactionListViewReadyTwoSourceUseCaseTransformer(transactionManager: _entityGateway.transactionManager);
//      final transformer = TransactionListViewReadyOneSourceUseCaseTransformer(transactionManager: _entityGateway.transactionManager);
      transformer.transform(output:  _controller.sink);

  }

    @override
    void dispose() {
        _controller.close();
    }


}
