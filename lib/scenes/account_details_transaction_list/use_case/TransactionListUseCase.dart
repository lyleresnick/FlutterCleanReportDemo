import 'package:flutter_clean_report_demo/entity_gateway/EntityGateway.dart';
import 'TransactionListUseCaseOutput.dart';
//import 'TransactionListViewReadyTwoSourceUseCaseTransformer.dart';
import 'TransactionListViewReadyOneSourceUseCaseTransformer.dart';


class TransactionListUseCase {

    final EntityGateway entityGateway;
    TransactionListUseCaseOutput output;
    TransactionListUseCase({this.entityGateway});

  void eventViewReady() {

//      final transformer = TransactionListViewReadyTwoSourceUseCaseTransformer(transactionManager: entityGateway.twoSourceManager);
      final transformer = TransactionListViewReadyOneSourceUseCaseTransformer(transactionManager: entityGateway.oneSourceManager);
      transformer.transform(output: output);



  }

}
