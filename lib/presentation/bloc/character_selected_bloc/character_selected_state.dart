part of 'character_selected_bloc.dart';

sealed class CharacterSelectedState extends Equatable {
  const CharacterSelectedState();

  @override
  List<Object?> get props => [];
}

class CharacterSelectedInitial extends CharacterSelectedState {
  final CharacterEntity? characterEntity;

  const CharacterSelectedInitial({this.characterEntity});

  @override
  List<Object?> get props => [characterEntity];
}
