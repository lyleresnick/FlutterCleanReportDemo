part of transaction_api.api;

// TransactionResponse
class TransactionResponse {
     
     String group;
     
     DateTime date;
     
     String description;
     
     String amount;
     
     String debit;
  TransactionResponse();

  @override
  String toString() {
    return 'TransactionResponse[group=$group, date=$date, description=$description, amount=$amount, debit=$debit, ]';
  }

  fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  
    {
      final _jsonData = json[r'group'];
      group = (_jsonData == null) ? null :
        _jsonData;
    } // _jsonFieldName
    {
      final _jsonData = json[r'date'];
      date = (_jsonData == null) ? null :
        DateTime.parse(_jsonData);
    } // _jsonFieldName
    {
      final _jsonData = json[r'description'];
      description = (_jsonData == null) ? null :
        _jsonData;
    } // _jsonFieldName
    {
      final _jsonData = json[r'amount'];
      amount = (_jsonData == null) ? null :
        _jsonData;
    } // _jsonFieldName
    {
      final _jsonData = json[r'debit'];
      debit = (_jsonData == null) ? null :
        _jsonData;
    } // _jsonFieldName

  }

  TransactionResponse.fromJson(Map<String, dynamic> json) {
    fromJson(json); // allows child classes to call
  }

  Map<String, dynamic> toJson() {

    final json = <String, dynamic>{};
    if (group != null) {
        json[r'group'] = LocalApiClient.serialize(group);
    }
    if (date != null) {
      json[r'date'] = date.toUtc().toIso8601String();
    }
    if (description != null) {
        json[r'description'] = LocalApiClient.serialize(description);
    }
    if (amount != null) {
        json[r'amount'] = LocalApiClient.serialize(amount);
    }
    if (debit != null) {
        json[r'debit'] = LocalApiClient.serialize(debit);
    }
    return json;
  }
  static List<TransactionResponse> listFromJson(List<dynamic> json) {
    return json == null ? <TransactionResponse>[] : json.map((value) => TransactionResponse.fromJson(value)).toList();
  }

  static Map<String, TransactionResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, TransactionResponse>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = TransactionResponse.fromJson(value));
    }
    return map;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is TransactionResponse && runtimeType == other.runtimeType) {
    return 

     group == other.group &&
  
          date == other.date &&
    

     description == other.description &&
  

     amount == other.amount &&
  

     debit == other.debit
    ;
    }

    return false;
  }

  @override
  int get hashCode {
    var hashCode = runtimeType.hashCode;

    

    if (group != null) {
      hashCode = hashCode ^ group.hashCode;
    }

            if (date != null) {
              hashCode = hashCode ^ date.hashCode;
            }
    

    if (description != null) {
      hashCode = hashCode ^ description.hashCode;
    }


    if (amount != null) {
      hashCode = hashCode ^ amount.hashCode;
    }


    if (debit != null) {
      hashCode = hashCode ^ debit.hashCode;
    }


    return hashCode;
  }

  TransactionResponse copyWith({
       String group,
       DateTime date,
       String description,
       String amount,
       String debit,
    }) {
    TransactionResponse copy = TransactionResponse();
        copy.group = group ?? this.group;
        copy.date = date ?? this.date;
        copy.description = description ?? this.description;
        copy.amount = amount ?? this.amount;
        copy.debit = debit ?? this.debit;
    return copy;
  }
}

