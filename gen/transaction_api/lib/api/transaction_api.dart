part of transaction_api.api;


class TransactionApi {
  final TransactionApiDelegate apiDelegate;
  TransactionApi(ApiClient apiClient) : assert(apiClient != null), apiDelegate = TransactionApiDelegate(apiClient);


  /// Returns all Transactions.
  ///
  /// 
    Future<List<TransactionResponse>> 
  getAll({Options options}) async {

    final response = await apiDelegate.getAll( options: options, );

    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    } else {
      return await apiDelegate.getAll_decode(response);
    }
  }

  /// Returns all Transactions.
  ///
  /// 
  /// Returns authorized Transactions only.
  ///
  /// 
    Future<List<TransactionResponse>> 
  getAuthorized({Options options}) async {

    final response = await apiDelegate.getAuthorized( options: options, );

    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    } else {
      return await apiDelegate.getAuthorized_decode(response);
    }
  }

  /// Returns authorized Transactions only.
  ///
  /// 
  /// Returns posted Transactions only.
  ///
  /// 
    Future<List<TransactionResponse>> 
  getPosted({Options options}) async {

    final response = await apiDelegate.getPosted( options: options, );

    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, await decodeBodyBytes(response));
    } else {
      return await apiDelegate.getPosted_decode(response);
    }
  }

  /// Returns posted Transactions only.
  ///
  /// 
}


  class TransactionApiDelegate {
  final ApiClient apiClient;

TransactionApiDelegate(this.apiClient) : assert(apiClient != null);

    Future<ApiResponse>
  getAll({Options options}) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    final __path = '/sortedTransactions/all';

    // query params
    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{}..addAll(options?.headers?.cast<String, String>() ?? {});
    if(headerParams['Accept'] == null) {
      // we only want to accept this format as we can parse it
      headerParams['Accept'] = 'application/json';
    }


    final authNames = <String>[];
    final opt = options ?? Options();

      final contentTypes = [];

      if (contentTypes.isNotEmpty && headerParams['Content-Type'] == null) {
      headerParams['Content-Type'] = contentTypes[0];
      }
      if (postBody != null) {
      postBody = LocalApiClient.serialize(postBody);
      }

    opt.headers = headerParams;
    opt.method = 'GET';

    return await apiClient.invokeAPI(__path, queryParams, postBody, authNames, opt);
    }

    Future<List<TransactionResponse>> 
  getAll_decode(ApiResponse response) async {
    if(response.body != null) {
          return (LocalApiClient.deserializeFromString(await decodeBodyBytes(response), 'List<TransactionResponse>') as List).map((item) => item as TransactionResponse).toList();
    }

    return null;
    }
    Future<ApiResponse>
  getAuthorized({Options options}) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    final __path = '/sortedTransactions/authorized';

    // query params
    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{}..addAll(options?.headers?.cast<String, String>() ?? {});
    if(headerParams['Accept'] == null) {
      // we only want to accept this format as we can parse it
      headerParams['Accept'] = 'application/json';
    }


    final authNames = <String>[];
    final opt = options ?? Options();

      final contentTypes = [];

      if (contentTypes.isNotEmpty && headerParams['Content-Type'] == null) {
      headerParams['Content-Type'] = contentTypes[0];
      }
      if (postBody != null) {
      postBody = LocalApiClient.serialize(postBody);
      }

    opt.headers = headerParams;
    opt.method = 'GET';

    return await apiClient.invokeAPI(__path, queryParams, postBody, authNames, opt);
    }

    Future<List<TransactionResponse>> 
  getAuthorized_decode(ApiResponse response) async {
    if(response.body != null) {
          return (LocalApiClient.deserializeFromString(await decodeBodyBytes(response), 'List<TransactionResponse>') as List).map((item) => item as TransactionResponse).toList();
    }

    return null;
    }
    Future<ApiResponse>
  getPosted({Options options}) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    final __path = '/sortedTransactions/posted';

    // query params
    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{}..addAll(options?.headers?.cast<String, String>() ?? {});
    if(headerParams['Accept'] == null) {
      // we only want to accept this format as we can parse it
      headerParams['Accept'] = 'application/json';
    }


    final authNames = <String>[];
    final opt = options ?? Options();

      final contentTypes = [];

      if (contentTypes.isNotEmpty && headerParams['Content-Type'] == null) {
      headerParams['Content-Type'] = contentTypes[0];
      }
      if (postBody != null) {
      postBody = LocalApiClient.serialize(postBody);
      }

    opt.headers = headerParams;
    opt.method = 'GET';

    return await apiClient.invokeAPI(__path, queryParams, postBody, authNames, opt);
    }

    Future<List<TransactionResponse>> 
  getPosted_decode(ApiResponse response) async {
    if(response.body != null) {
          return (LocalApiClient.deserializeFromString(await decodeBodyBytes(response), 'List<TransactionResponse>') as List).map((item) => item as TransactionResponse).toList();
    }

    return null;
    }
  }


