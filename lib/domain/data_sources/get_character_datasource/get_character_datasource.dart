import '../../../data/models/models.dart';

abstract class GetCharacterDataSource {
  Future<CharacterModel> getCharacter({required int characterId});
}
