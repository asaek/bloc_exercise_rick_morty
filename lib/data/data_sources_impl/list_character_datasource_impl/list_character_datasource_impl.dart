import 'package:bloc_rick_morty/domain/entities/entities.dart';
import 'package:dio/dio.dart';

import '../../../domain/data_sources/data_sources.dart';
import '../../../domain/entities/peticion_details_entity/peticion_details_entity.dart';
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

      final PeticionDetailsModel peticionDetailsModel =
          PeticionDetailsModel.fromJson(response.data);

      listCharacterEntity = peticionDetailsModel.charactersModel
          .map((e) => characterMapper(charactersModel: e))
          .toList();
      final peticionDetailsEntity = PeticionDetailsEntity(
        characters: List<CharacterEntity>.from(listCharacterEntity),
        count: peticionDetailsModel.count,
        next: peticionDetailsModel.next,
        prev: peticionDetailsModel.prev,
      );
      return peticionDetailsEntity;
    } catch (e) {
      //! Se tiene que mejorar la captura de errores
      //! si llega vacio los personajes atrapar la excepcion
      print(e);
      return PeticionDetailsEntity(
        characters: null,
        count: null,
        next: null,
        prev: null,
        error: e.toString(),
      );
      // if (e is NetworkException || e is DioException) {}
      // throw Exception('Error en la peticion');
    }
  }
}
