part of 'home_list_characters_bloc.dart';

sealed class HomeListCharactersEvent extends Equatable {
  const HomeListCharactersEvent();

  @override
  List<Object> get props => [];
}

class FetchCharactersEvent extends HomeListCharactersEvent {
  final int page;

  const FetchCharactersEvent({required this.page});

  @override
  List<Object> get props => [page];
}
