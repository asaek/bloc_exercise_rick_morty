import '../../entities/peticion_details_entity/peticion_details_entity.dart';

abstract class PeticionDetailsDataSource {
  Future<PeticionDetailsEntity> getCharacters({required int page});
}
