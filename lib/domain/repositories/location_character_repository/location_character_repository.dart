import '../../entities/entities.dart';

abstract class LocationCharacterRepository {
  Future<LocationOriginEntity> getLocation({required String locationUrl});
}
