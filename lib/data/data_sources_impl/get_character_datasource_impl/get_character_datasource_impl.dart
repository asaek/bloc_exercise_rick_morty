import 'package:dio/dio.dart';

import '../../../domain/data_sources/data_sources.dart';
import '../../models/models.dart';

class GetCharacterDataSourceImpl implements GetCharacterDataSource {
  @override
  Future<CharacterModel> getCharacter({required int characterId}) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://rickandmortyapi.com/api/',
      ),
    );

    try {
      final Response<dynamic> response =
          await dio.get('character/$characterId');
      if (response.statusCode == 200) {
        final CharacterModel characterModel =
            CharacterModel.fromJson(response.data);

        final CharacterModel characterReturn = CharacterModel(
          id: characterModel.id,
          name: characterModel.name,
          status: characterModel.status,
          species: characterModel.species,
          type: characterModel.type,
          gender: characterModel.gender,
          origin: characterModel.origin,
          location: characterModel.location,
          image: characterModel.image,
          episode: characterModel.episode,
          url: characterModel.url,
          created: characterModel.created,
          error: null,
        );

        return characterReturn;
      } else {
        return CharacterModel(
          id: null,
          name: null,
          status: null,
          species: null,
          type: null,
          gender: null,
          origin: null,
          location: null,
          image: null,
          episode: null,
          url: null,
          created: null,
          error: 'Error en la peticion de datos',
        );
      }
    } catch (e) {
      return CharacterModel(
        id: null,
        name: null,
        status: null,
        species: null,
        type: null,
        gender: null,
        origin: null,
        location: null,
        image: null,
        episode: null,
        url: null,
        created: null,
        error: 'Error en el procesado del objeto',
      );
    }
  }
}
