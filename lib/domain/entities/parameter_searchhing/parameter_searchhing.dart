enum Statuss { alive, dead, unknown }

enum Species { human, alien, humanoid, unknown }

enum Gender { female, male, genderless, unknown }

class ParametersSearching {
  String? nombre;
  Statuss? status;
  Species? species;
  String? type;
  Gender? gender;
  int page;

  ParametersSearching({
    this.nombre,
    this.status,
    this.species,
    this.type,
    this.gender,
    required this.page,
  });
}
