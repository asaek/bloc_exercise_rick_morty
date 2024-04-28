import '../../entities/entities.dart';

abstract class PeticionDetailsDataSource {
  Future<PeticionDetailsEntity> getCharacters(
      {required ParametersSearchingEntity searchingParameters});
}
