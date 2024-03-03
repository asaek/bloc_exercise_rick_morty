import 'package:bloc_rick_morty/domain/entities/entities.dart';

abstract class PeticionDetailsRepository {
  Future<PeticionDetailsEntity> getPeticionDetails(
      {required ParametersSearching searchingParameters});
}
