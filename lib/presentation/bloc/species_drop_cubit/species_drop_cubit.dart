import 'package:bloc/bloc.dart';
import 'package:bloc_rick_morty/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

part 'species_drop_state.dart';

class SpeciesDropCubit extends Cubit<SpeciesDropCubitState> {
  SpeciesDropCubit({
    Species species = Species.human,
  }) : super(SpeciesDropCubitState(species: species));

  void changeSpecies({required Species species}) {
    emit(SpeciesDropCubitState(species: species));
  }
}
