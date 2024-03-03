import 'package:bloc_rick_morty/domain/entities/entities.dart';

import '../../repositories/repositories.dart';

sealed class FetchCharactersUseCase {
  Future<PeticionDetailsEntity> callCharacters(
      {required ParametersSearching searchingParameters});
}

class FetchCharactersUseCaseImpl implements FetchCharactersUseCase {
  final PeticionDetailsRepository peticionDetailsRepository;

  FetchCharactersUseCaseImpl({required this.peticionDetailsRepository});

  @override
  Future<PeticionDetailsEntity> callCharacters(
      {required ParametersSearching searchingParameters}) async {
    return await peticionDetailsRepository.getPeticionDetails(
        searchingParameters: searchingParameters);
  }
}
