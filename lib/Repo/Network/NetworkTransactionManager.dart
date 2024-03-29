import 'dart:async';

import 'package:flutter_clean_report_demo/Repo/Entities/Transaction.dart';
import 'package:flutter_clean_report_demo/Repo/Network/NetworkClient.dart';
import 'package:transaction_api/api.dart';

import '../Factory/Result.dart';
import '../Factory/TransactionManager.dart';

class NetworkTransactionManager extends TransactionManager {
  final NetworkClient networkClient;
  NetworkTransactionManager(this.networkClient);

  @override
  Future<Result<List<Transaction>>> fetchAllTransactions() async {
    try {
      final response = await networkClient.transactionApi.getAll();
      if (response == null) return FailureResult(code: 0, description: "No Content");
      final data =
          response.map((transaction) => Transaction.fromTransactionResponse(transaction)).toList();
      return SuccessResult(data: data);
    } on ApiException catch (e) {
      return FailureResult(code: e.code, description: e.message!);
    }
  }

  @override
  Future<Result<List<Transaction>>> fetchPostedTransactions() async {
    try {
      final response = await networkClient.transactionApi.getPosted();
      if (response == null) return FailureResult(code: 0, description: "No Content");
      final data =
          response.map((transaction) => Transaction.fromTransactionResponse(transaction)).toList();
      return SuccessResult(data: data);
    } on ApiException catch (e) {
      return FailureResult(code: e.code, description: e.message!);
    }
  }

  @override
  Future<Result<List<Transaction>>> fetchAuthorizedTransactions() async {
    try {
      final response = await networkClient.transactionApi.getAuthorized();
      if (response == null) return FailureResult(code: 0, description: "No Content");
      final data =
          response.map((transaction) => Transaction.fromTransactionResponse(transaction)).toList();
      return SuccessResult(data: data);
    } on ApiException catch (e) {
      return FailureResult(code: e.code, description: e.message!);
    }
  }
}
