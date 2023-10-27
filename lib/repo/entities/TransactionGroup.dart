//  Copyright © 2019 Lyle Resnick. All rights reserved.

enum TransactionGroup {
    authorized,
    posted
}


extension TransactionGroupRawValue on TransactionGroup {

    String get rawValue {
        switch (this) {
            case TransactionGroup.authorized:
                return "Authorized";
            case TransactionGroup.posted:
                return "Posted";
        }
    }
}
