import '../../entities/peticion_details_entity/peticion_details_entity.dart';

abstract class PeticionDetailsRepository {
  Future<PeticionDetailsEntity> getPeticionDetails({required int page});
}
