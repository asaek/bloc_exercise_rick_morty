import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';

part 'character_selected_event.dart';
part 'character_selected_state.dart';

class CharacterSelectedBloc
    extends Bloc<CharacterSelectedEvent, CharacterSelectedState> {
  CharacterSelectedBloc()
      : super(const CharacterSelectedInitial(characterEntity: null)) {
    // on<CharacterSelectedEvent>((event, emit) {});
    on<CharacterSelectedEvento>(_onCharacterSelected);
  }

  void _onCharacterSelected(
      CharacterSelectedEvento event, Emitter<CharacterSelectedState> emit) {
    emit(CharacterSelectedInitial(characterEntity: event.characterEntity));
  }

  void selectCharacter(CharacterEntity characterEntity) {
    add(CharacterSelectedEvento(characterEntity: characterEntity));
  }
}
