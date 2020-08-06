//  Copyright © 2019 Lyle Resnick. All rights reserved.

import 'EntityGateway.dart';
import '../managers/OneSourceManager.dart';
import '../managers/OneSourceManagerImpl.dart';
import '../managers/TwoSourceManager.dart';
import '../managers/TwoSourceManagerImpl.dart';

class EntityGatewayImpl implements EntityGateway {

    OneSourceManager get oneSourceManager => OneSourceManagerImpl();
    TwoSourceManager get twoSourceManager => TwoSourceManagerImpl();
}
