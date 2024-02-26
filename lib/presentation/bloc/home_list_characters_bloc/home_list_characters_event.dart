part of 'home_list_characters_bloc.dart';

sealed class HomeListCharactersEvent extends Equatable {
  const HomeListCharactersEvent();

  @override
  List<Object> get props => [];
}

class FetchCharactersEvent extends HomeListCharactersEvent {
  const FetchCharactersEvent();

  @override
  List<Object> get props => [];
}

class FetchNextCharactersEvent extends HomeListCharactersEvent {
  final int page;
  const FetchNextCharactersEvent({required this.page});

  @override
  List<Object> get props => [page];
}
