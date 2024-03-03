part of 'species_drop_cubit.dart';

class SpeciesDropCubitState extends Equatable {
  final Species species;
  const SpeciesDropCubitState({required this.species});

  @override
  List<Object> get props => [species];
}
