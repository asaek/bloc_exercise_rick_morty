enum Statuss { selecciona, alive, dead, unknown }

enum Species { selecciona, human, alien, humanoid, unknown }

enum Gender { selecciona, female, male, genderless, unknown }

class ParametersSearchingEntity {
  String? nombre;
  Statuss? status;
  Species? species;
  String? type;
  Gender? gender;
  int page;

  ParametersSearchingEntity({
    this.nombre,
    this.status,
    this.species,
    this.type,
    this.gender,
    required this.page,
  });
}
