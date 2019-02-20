import 'package:flutter_clean_report_demo/entity_gateway/EntityGateway.dart';
import 'TransactionListUseCaseOutput.dart';
import 'TransactionListViewReadyTwoSourceUseCaseTransformer.dart';


class TransactionListUseCase {

    final EntityGateway entityGateway;
    TransactionListUseCaseOutput output;
    TransactionListUseCase({this.entityGateway});

  void eventViewReady() {

      final transformer = TransactionListViewReadyTwoSourceUseCaseTransformer(transactionManager: entityGateway.twoSourceManager);
      transformer.transform(output: output);



  }

}
