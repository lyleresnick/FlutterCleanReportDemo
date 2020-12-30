part of transaction_api.api;

// ErrorResponse
class ErrorResponse {
     
     String reason;
     
     bool error;
  ErrorResponse();

  @override
  String toString() {
    return 'ErrorResponse[reason=$reason, error=$error, ]';
  }

  fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  
    {
      final _jsonData = json[r'reason'];
      reason = (_jsonData == null) ? null :
        _jsonData;
    } // _jsonFieldName
    {
      final _jsonData = json[r'error'];
      error = (_jsonData == null) ? null :
        _jsonData;
    } // _jsonFieldName

  }

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    fromJson(json); // allows child classes to call
  }

  Map<String, dynamic> toJson() {

    final json = <String, dynamic>{};
    if (reason != null) {
        json[r'reason'] = LocalApiClient.serialize(reason);
    }
    if (error != null) {
        json[r'error'] = LocalApiClient.serialize(error);
    }
    return json;
  }
  static List<ErrorResponse> listFromJson(List<dynamic> json) {
    return json == null ? <ErrorResponse>[] : json.map((value) => ErrorResponse.fromJson(value)).toList();
  }

  static Map<String, ErrorResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ErrorResponse>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = ErrorResponse.fromJson(value));
    }
    return map;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is ErrorResponse && runtimeType == other.runtimeType) {
    return 

     reason == other.reason &&
  

     error == other.error
    ;
    }

    return false;
  }

  @override
  int get hashCode {
    var hashCode = runtimeType.hashCode;

    

    if (reason != null) {
      hashCode = hashCode ^ reason.hashCode;
    }


    if (error != null) {
      hashCode = hashCode ^ error.hashCode;
    }


    return hashCode;
  }

  ErrorResponse copyWith({
       String reason,
       bool error,
    }) {
    ErrorResponse copy = ErrorResponse();
        copy.reason = reason ?? this.reason;
        copy.error = error ?? this.error;
    return copy;
  }
}

