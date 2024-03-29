# transaction_api
No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: v1
- Build package: org.openapitools.codegen.languages.DartClientCodegen

## Requirements

Dart 2.12 or later

## Installation & Usage

### Github
If this Dart package is published to Github, add the following dependency to your pubspec.yaml
```
dependencies:
  transaction_api:
    git: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
```

### Local
To use the package in your local drive, add the following dependency to your pubspec.yaml
```
dependencies:
  transaction_api:
    path: /path/to/transaction_api
```

## Tests

TODO

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

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

## Documentation for API Endpoints

All URIs are relative to *https://report-demo-backend-lyle.fly.dev/api*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*TransactionApi* | [**getAll**](doc//TransactionApi.md#getall) | **GET** /sortedTransactions/all | Returns all Transactions.
*TransactionApi* | [**getAuthorized**](doc//TransactionApi.md#getauthorized) | **GET** /sortedTransactions/authorized | Returns authorized Transactions only.
*TransactionApi* | [**getPosted**](doc//TransactionApi.md#getposted) | **GET** /sortedTransactions/posted | Returns posted Transactions only.


## Documentation For Models

 - [ErrorResponse](doc//ErrorResponse.md)
 - [TransactionResponse](doc//TransactionResponse.md)


## Documentation For Authorization

Endpoints do not require authorization.


## Author



