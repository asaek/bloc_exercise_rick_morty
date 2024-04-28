import '../../entities/entities.dart';

abstract class LocationCharacterDataSource {
  Future<LocationOriginEntity> getLocation({required String locationUrl});
}
