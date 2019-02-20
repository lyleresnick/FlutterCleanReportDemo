import '../managers/OneSourceManager.dart';
import '../managers/TwoSourceManager.dart';

abstract class EntityGateway {
    OneSourceManager get oneSourceManager;
    TwoSourceManager get twoSourceManager;
}