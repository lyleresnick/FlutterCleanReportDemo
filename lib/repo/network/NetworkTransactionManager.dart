import 'dart:async';

import 'package:flutter_clean_report_demo/repo/entities/TransactionEntity.dart';
import 'package:flutter_clean_report_demo/repo/network/NetworkClient.dart';
import 'package:openapi_dart_common/openapi.dart';
import 'package:transaction_api/api.dart';

import '../factory/Result.dart';
import '../factory/TransactionManager.dart';

class NetworkTransactionManager extends TransactionManager {


  final NetworkClient networkClient;
  NetworkTransactionManager(this.networkClient);

  @override
  Future<Result<List<TransactionEntity>, TransactionException>> fetchAllTransactions() async {
    try {
      final response = await networkClient.transactionApi.getAll();
      final data = response
              .map((transaction) => TransactionEntity.fromTransactionResponse(transaction))
              .toList();
      if (data == null)
        return FailureResult(code: 0, description: "A required field is missing from the TransactionResponse");
      return SuccessResult(data: data);
    } on ApiException catch (e) {
      if(e.code == 404) {
        return SemanticErrorResult(reason: TransactionException.notFound);
      }
      return FailureResult(code: e.code, description: e.message);
    }
  }

  @override
  Future<Result<List<TransactionEntity>, TransactionException>> fetchPostedTransactions() async {
    try {
      final response = await networkClient.transactionApi.getPosted();
      final data = response
              .map((transaction) => TransactionEntity.fromTransactionResponse(transaction))
              .toList();
      if (data == null)
        return FailureResult(code: 0, description: "A required field is missing from the TransactionResponse");
      return SuccessResult(data: data);
    } on ApiException catch (e) {
      if(e.code == 404) {
        return SemanticErrorResult(reason: TransactionException.notFound);
      }
      return FailureResult(code: e.code, description: e.message);
    }
  }

  @override
  Future<Result<List<TransactionEntity>, TransactionException>> fetchAuthorizedTransactions() async {
    try {
      final List<TransactionResponse> response = await networkClient.transactionApi.getAuthorized();
      final data = response
              .map((transaction) => TransactionEntity.fromTransactionResponse(transaction))
              .toList();
      if (data == null)
        return FailureResult(code: 0, description: "A required field is missing from the TransactionResponse");
      return SuccessResult(data: data);
    } on ApiException catch (e) {
      if(e.code == 404) {
        return SemanticErrorResult(reason: TransactionException.notFound);
      }
      return FailureResult(code: e.code, description: e.message);
    }
  }

}

