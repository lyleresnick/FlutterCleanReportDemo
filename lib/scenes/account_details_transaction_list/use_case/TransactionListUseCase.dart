//  Copyright © 2019 Lyle Resnick. All rights reserved.
import 'package:flutter/foundation.dart';
import '../../../entity_gateway/EntityGateway.dart';
import 'TransactionListUseCaseOutput.dart';
import 'TransactionListViewReadyTwoSourceUseCaseTransformer.dart';
//import 'TransactionListViewReadyOneSourceUseCaseTransformer.dart';


class TransactionListUseCase {

    TransactionListUseCaseOutput output;
    final EntityGateway _entityGateway;
    TransactionListUseCase({@required EntityGateway entityGateway}) : _entityGateway = entityGateway;

  void eventViewReady() {

      final transformer = TransactionListViewReadyTwoSourceUseCaseTransformer(transactionManager: _entityGateway.twoSourceManager);
//      final transformer = TransactionListViewReadyOneSourceUseCaseTransformer(transactionManager: _entityGateway.oneSourceManager);
      transformer.transform(output: output);



  }

}
