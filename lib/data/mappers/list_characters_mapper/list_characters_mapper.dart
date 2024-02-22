import '../../../domain/entities/entities.dart';
import '../../models/models.dart';

CharacterEntity characterMapper({required CharacterModel charactersModel}) {
  return CharacterEntity(
    id: charactersModel.id,
    name: charactersModel.name,
    status: charactersModel.status,
    species: charactersModel.species,
    type: charactersModel.type,
    gender: charactersModel.gender,
    origin: OriginAndLocationEntity(
      name: charactersModel.origin.name,
      url: charactersModel.origin.url,
    ),
    location: OriginAndLocationEntity(
      name: charactersModel.location.name,
      url: charactersModel.location.url,
    ),
    image: charactersModel.image,
    episode: charactersModel.episode,
  );
}
