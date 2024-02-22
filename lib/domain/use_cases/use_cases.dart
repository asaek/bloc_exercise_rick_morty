import 'package:bloc_rick_morty/domain/entities/entities.dart';

import '../repositories/repositories.dart';

sealed class FetchCharactersUseCase {
  Future<PeticionDetailsEntity> callCharacters({required int page});
}

class FetchCharactersUseCaseImpl implements FetchCharactersUseCase {
  final PeticionDetailsRepository peticionDetailsRepository;

  FetchCharactersUseCaseImpl({required this.peticionDetailsRepository});

  @override
  Future<PeticionDetailsEntity> callCharacters({required int page}) async {
    return await peticionDetailsRepository.getPeticionDetails(page: page);
  }
}
