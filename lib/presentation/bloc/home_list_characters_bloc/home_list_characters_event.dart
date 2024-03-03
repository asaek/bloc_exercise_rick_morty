part of 'home_list_characters_bloc.dart';

sealed class HomeListCharactersEvent extends Equatable {
  const HomeListCharactersEvent();

  @override
  List<Object?> get props => [];
}

class FetchCharactersEvent extends HomeListCharactersEvent {
  final ParametersSearching parametersSearching;
  const FetchCharactersEvent({required this.parametersSearching});

  @override
  List<Object> get props => [parametersSearching];
}
