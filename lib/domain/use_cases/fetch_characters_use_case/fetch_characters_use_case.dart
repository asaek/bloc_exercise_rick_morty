import 'package:bloc_rick_morty/domain/entities/entities.dart';

import '../../repositories/repositories.dart';

sealed class FetchCharactersUseCase {
  Future<PeticionDetailsEntity> callCharacters(
      {required ParametersSearchingEntity searchingParameters});
}

//* Implementación del Use Case la clase FetchLocationUseCase
class FetchCharactersUseCaseImpl implements FetchCharactersUseCase {
  final PeticionDetailsRepository peticionDetailsRepository;

  FetchCharactersUseCaseImpl({required this.peticionDetailsRepository});

  @override
  Future<PeticionDetailsEntity> callCharacters(
      {required ParametersSearchingEntity searchingParameters}) async {
    return await peticionDetailsRepository.getPeticionDetails(
        searchingParameters: searchingParameters);
  }
}
