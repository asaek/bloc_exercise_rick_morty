import 'package:bloc_rick_morty/domain/entities/entities.dart';
import 'package:dio/dio.dart';

import '../../../domain/data_sources/data_sources.dart';
import '../../mappers/list_characters_mapper/list_characters_mapper.dart';
import '../../models/models.dart';

class PeticionDetailsDataSourceImpl implements PeticionDetailsDataSource {
  @override
  Future<PeticionDetailsEntity> getCharacters({required int page}) async {
    List<CharacterEntity> listCharacterEntity = [];
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://rickandmortyapi.com/api/',
        queryParameters: {
          'page': page,
        },
      ),
    );

    try {
      final response = await dio.get('character');
      if (response.statusCode == 200 && response.data != null) {
        final PeticionDetailsModel peticionDetailsModel =
            PeticionDetailsModel.fromJson(response.data);

        // if (peticionDetailsModel.charactersModel.isEmpty) {
        //   return const PeticionDetailsEntity(
        //     characters: [],
        //     count: 0,
        //     next: null,
        //     prev: null,
        //     error:
        //         'Se llego al final de las paginas de personajes disponibles (42)',
        //   );
        // }

        listCharacterEntity = peticionDetailsModel.charactersModel
            .map((e) => characterMapper(charactersModel: e))
            .toList();

        final PeticionDetailsEntity peticionDetailsEntity =
            PeticionDetailsEntity(
          characters: List<CharacterEntity>.from(listCharacterEntity),
          count: peticionDetailsModel.count,
          next: peticionDetailsModel.next,
          prev: peticionDetailsModel.prev,
        );
        return peticionDetailsEntity;
      } else {
        return const PeticionDetailsEntity(
          characters: [],
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
        count: 0,
        next: null,
        prev: null,
        error: e.toString(),
      );
    }
  }
}
