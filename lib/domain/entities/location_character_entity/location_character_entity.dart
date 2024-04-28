import '../entities.dart';

class LocationOriginEntity {
  final int? id;
  final String? name;
  final String? planetType;
  final String? dimension;
  final String? error;
  final List<CharacterEntity>? residents;

  LocationOriginEntity({
    this.error,
    required this.id,
    required this.name,
    required this.planetType,
    required this.dimension,
    required this.residents,
  });
}
