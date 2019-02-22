//  Copyright © 2019 Lyle Resnick. All rights reserved.

enum TransactionGroup {
    authorized,
    posted
}

String transactionGroupToString(TransactionGroup transactionGroup) {
    switch ( transactionGroup ) {
    case TransactionGroup.authorized:
        return "Authorized";
    case TransactionGroup.posted:
        return "Posted";
    default:
        throw "Bad Group";
    }
}
