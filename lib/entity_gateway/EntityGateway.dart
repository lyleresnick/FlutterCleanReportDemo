//  Copyright © 2019 Lyle Resnick. All rights reserved.

import '../managers/OneSourceManager.dart';
import '../managers/TwoSourceManager.dart';

abstract class EntityGateway {
    OneSourceManager get oneSourceManager;
    TwoSourceManager get twoSourceManager;
}