import 'package:bloc_rick_morty/domain/entities/entities.dart';

class CharacterEntity {
  final int id;
  final String name;
  final bool status;
  final String species;
  final String type;
  final String gender;
  final OriginAndLocationEntity origin;
  final OriginAndLocationEntity location;
  final String image;
  final List<String> episode;
  // final String url;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    // required this.url,
  });
}
