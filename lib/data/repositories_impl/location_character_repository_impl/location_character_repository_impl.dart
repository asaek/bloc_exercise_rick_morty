import 'package:bloc_rick_morty/domain/entities/location_character_entity/location_character_entity.dart';

import '../../../domain/data_sources/data_sources.dart';
import '../../../domain/repositories/repositories.dart';

class LocationCharacterRepositoryImpl implements LocationCharacterRepository {
  final LocationCharacterDataSource locationCharacterDataSource;

  LocationCharacterRepositoryImpl({required this.locationCharacterDataSource});

  @override
  Future<LocationOriginEntity> getLocation({required String locationUrl}) {
    return locationCharacterDataSource.getLocation(locationUrl: locationUrl);
  }
}
