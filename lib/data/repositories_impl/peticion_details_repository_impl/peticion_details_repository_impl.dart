import '../../../domain/data_sources/data_sources.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/repositories/repositories.dart';

class PeticionDetailsRepositoryImpl implements PeticionDetailsRepository {
  final PeticionDetailsDataSource peticionDetailsDataSource;

  PeticionDetailsRepositoryImpl({required this.peticionDetailsDataSource});

  @override
  Future<PeticionDetailsEntity> getPeticionDetails(
      {required ParametersSearchingEntity searchingParameters}) {
    return peticionDetailsDataSource.getCharacters(
        searchingParameters: searchingParameters);
  }
}
