part of 'character_selected_bloc.dart';

sealed class CharacterSelectedEvent extends Equatable {
  const CharacterSelectedEvent();

  @override
  List<Object> get props => [];
}

final class CharacterSelectedEvento extends CharacterSelectedEvent {
  final CharacterEntity characterEntity;
  const CharacterSelectedEvento({required this.characterEntity});

  @override
  List<Object> get props => [characterEntity];
}
