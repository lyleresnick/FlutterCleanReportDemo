# transaction_api.api.TransactionApi

## Load the API package
```dart
import 'package:transaction_api/api.dart';
```

All URIs are relative to *https://report-demo-backend.herokuapp.com/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAll**](TransactionApi.md#getall) | **GET** /sortedTransactions/all | Returns all Transactions.
[**getAuthorized**](TransactionApi.md#getauthorized) | **GET** /sortedTransactions/authorized | Returns authorized Transactions only.
[**getPosted**](TransactionApi.md#getposted) | **GET** /sortedTransactions/posted | Returns posted Transactions only.


# **getAll**
> List<TransactionResponse> getAll()

Returns all Transactions.

### Example
```dart
import 'package:transaction_api/api.dart';

final api_instance = TransactionApi();

try {
    final result = api_instance.getAll();
    print(result);
} catch (e) {
    print('Exception when calling TransactionApi->getAll: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<TransactionResponse>**](TransactionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAuthorized**
> List<TransactionResponse> getAuthorized()

Returns authorized Transactions only.

### Example
```dart
import 'package:transaction_api/api.dart';

final api_instance = TransactionApi();

try {
    final result = api_instance.getAuthorized();
    print(result);
} catch (e) {
    print('Exception when calling TransactionApi->getAuthorized: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<TransactionResponse>**](TransactionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPosted**
> List<TransactionResponse> getPosted()

Returns posted Transactions only.

### Example
```dart
import 'package:transaction_api/api.dart';

final api_instance = TransactionApi();

try {
    final result = api_instance.getPosted();
    print(result);
} catch (e) {
    print('Exception when calling TransactionApi->getPosted: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<TransactionResponse>**](TransactionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

