import 'package:openapi_dart_common/openapi.dart';
import 'package:transaction_api/api.dart';

class NetworkClient {
  ApiClient _apiClient;
  TransactionApi _transactionApi;
  TransactionApi get transactionApi => _transactionApi;

  NetworkClient() {
    _apiClient = ApiClient(basePath: "https://report-demo-backend.herokuapp.com/api");
    _transactionApi = TransactionApi(_apiClient);
  }
}