import '../../entities/entities.dart';

abstract class PeticionDetailsDataSource {
  Future<PeticionDetailsEntity> getCharacters(
      {required ParametersSearching searchingParameters});
}
