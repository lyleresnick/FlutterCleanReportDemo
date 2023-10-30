import 'package:transaction_api/api.dart';

class NetworkClient {
  ApiClient _apiClient;
  late TransactionApi _transactionApi;
  TransactionApi get transactionApi => _transactionApi;

  NetworkClient()
      : _apiClient = ApiClient() {
    _transactionApi = TransactionApi(_apiClient);
  }
}