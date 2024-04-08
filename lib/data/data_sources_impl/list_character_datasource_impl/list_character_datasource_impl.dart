import 'package:bloc_rick_morty/domain/entities/entities.dart';
import 'package:dio/dio.dart';

import '../../../domain/data_sources/data_sources.dart';
import '../../mappers/list_characters_mapper/list_characters_mapper.dart';
import '../../models/models.dart';

class PeticionDetailsDataSourceImpl implements PeticionDetailsDataSource {
  @override
  Future<PeticionDetailsEntity> getCharacters(
      {required ParametersSearching searchingParameters}) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://rickandmortyapi.com/api/',
        queryParameters: {
          'page': searchingParameters.page,
          'name': searchingParameters.nombre,
          'status': (searchingParameters.status == null)
              ? null
              : searchingParameters.status.toString().split('.').last,
          'species': (searchingParameters.species == null)
              ? null
              : searchingParameters.species.toString().split('.').last,
          'type': searchingParameters.type,
          'gender': (searchingParameters.gender == null)
              ? null
              : searchingParameters.gender.toString().split('.').last,
        },
      ),
    );

    try {
      final Response<dynamic> response = await dio.get('character/');
      if (response.statusCode == 200) {
        final PeticionDetailsModel peticionDetailsModel =
            PeticionDetailsModel.fromJson(response.data);

        final List<CharacterEntity> listSearchCharacter =
            (peticionDetailsModel.charactersModel.isNotEmpty)
                ? peticionDetailsModel.charactersModel
                    .map((e) => characterMapper(charactersModel: e))
                    .toList()
                : [];

        final PeticionDetailsEntity peticionDetailsEntity =
            PeticionDetailsEntity(
          characters: List<CharacterEntity>.from(listSearchCharacter),
          count: peticionDetailsModel.count,
          next: peticionDetailsModel.next,
          prev: peticionDetailsModel.prev,
          page: peticionDetailsModel.pages,
        );
        return peticionDetailsEntity;
      } else {
        return const PeticionDetailsEntity(
          characters: [],
          page: 0,
          count: 0,
          next: null,
          prev: null,
          error: 'Error en la peticion de datos',
        );
      }
    } catch (e) {
      print(e);

      return PeticionDetailsEntity(
        characters: [],
        page: 0,
        count: 0,
        next: null,
        prev: null,
        error: e.toString(),
      );
    }
  }
}
