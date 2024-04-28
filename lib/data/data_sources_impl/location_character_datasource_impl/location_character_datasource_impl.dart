import 'package:dio/dio.dart';

import '../../../domain/data_sources/data_sources.dart';
import '../../../domain/entities/entities.dart';
import '../../mappers/list_characters_mapper/list_characters_mapper.dart';
import '../../models/models.dart';

class LocationCharacterDataSourceImpl implements LocationCharacterDataSource {
  final GetCharacterDataSource getCharacterDataSource;

  LocationCharacterDataSourceImpl({required this.getCharacterDataSource});
  @override
  Future<LocationOriginEntity> getLocation(
      {required String locationUrl}) async {
    print(locationUrl);

    if (locationUrl.isEmpty) {
      return LocationOriginEntity(
        id: null,
        name: null,
        planetType: null,
        dimension: null,
        residents: null,
        error: 'Desconocidos',
      );
    }

    late LocationOriginEntity locationEntity;

    final Dio dio = Dio(
      BaseOptions(
        baseUrl: locationUrl,
      ),
    );
    try {
      final Response<dynamic> response = await dio.get('');

      if (response.statusCode == 200) {
        final LocationOriginModel locationModel =
            LocationOriginModel.fromJson(response.data);
        final List<String> residents = locationModel.residents;
        final List<CharacterModel> residentsCharacterModel = [];
        List<CharacterEntity> residentsCharacterEntity;

        for (String resident in residents) {
          final String url = resident;
          final int lastSlashIndex = url.lastIndexOf('/');
          final String number = url.substring(lastSlashIndex + 1);

          print(number);

          final CharacterModel character = await getCharacterDataSource
              .getCharacter(characterId: int.parse(number));

          residentsCharacterModel.add(character);
        }
        residentsCharacterEntity = residentsCharacterModel
            .map((e) => characterModelToEntityMapper(charactersModel: e))
            .toList();

        locationEntity = LocationOriginEntity(
          id: locationModel.id,
          name: locationModel.name,
          planetType: locationModel.planetType,
          dimension: locationModel.dimension,
          residents: residentsCharacterEntity,
          error: null,
        );
        return locationEntity;
      } else {
        locationEntity = LocationOriginEntity(
          id: null,
          name: null,
          planetType: null,
          dimension: null,
          residents: null,
          error: 'Error de peticion',
        );
      }
    } catch (e) {
      locationEntity = LocationOriginEntity(
        id: null,
        name: null,
        planetType: null,
        dimension: null,
        residents: null,
        error: 'Error de mapeo',
      );
    }

    return locationEntity;
  }
}
