import 'package:bloc/bloc.dart';
import 'package:bloc_rick_morty/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

part 'species_drop_state.dart';

typedef SpeciesForSearch = void Function(Species value);

class SpeciesDropCubit extends Cubit<SpeciesDropCubitState> {
  final SpeciesForSearch? speciesForSearch;
  SpeciesDropCubit({
    Species species = Species.human,
    this.speciesForSearch,
  }) : super(SpeciesDropCubitState(species: species));

  void changeSpecies({required Species species}) {
    emit(SpeciesDropCubitState(species: species));
    speciesForSearch?.call(species);
  }
}
