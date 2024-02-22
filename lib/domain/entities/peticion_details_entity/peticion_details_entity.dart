// ! Se tiene que agregar los tipos de errores del try catch
import '../entities.dart';

class PeticionDetailsEntity {
  final int? count;
  final String? next;
  final String? prev;
  final String? error;
  final List<CharacterEntity>? characters;
  const PeticionDetailsEntity({
    required this.characters,
    required this.count,
    required this.next,
    required this.prev,
    this.error,
  });
}
