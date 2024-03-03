import '../entities.dart';

class PeticionDetailsEntity {
  final int count;
  final String? next;
  final String? prev;
  final String? error;
  final int page;
  final List<CharacterEntity> characters;
  const PeticionDetailsEntity({
    required this.page,
    required this.characters,
    required this.count,
    required this.next,
    required this.prev,
    this.error,
  });
}
