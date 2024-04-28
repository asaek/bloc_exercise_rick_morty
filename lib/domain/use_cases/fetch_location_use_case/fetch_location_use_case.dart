import '../../entities/entities.dart';
import '../../repositories/repositories.dart';

sealed class FetchLocationUseCase {
  Future<LocationOriginEntity> callLocation({required String locationUrl});
}

//* Implementación del Use Case la clase FetchLocationUseCase
class FetchLocationUseCaseImpl implements FetchLocationUseCase {
  final LocationCharacterRepository locationCharacterRepository;

  FetchLocationUseCaseImpl({required this.locationCharacterRepository});

  @override
  Future<LocationOriginEntity> callLocation(
      {required String locationUrl}) async {
    return await locationCharacterRepository.getLocation(
        locationUrl: locationUrl);
  }
}
