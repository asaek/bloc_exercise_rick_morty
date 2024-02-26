part of 'home_list_characters_bloc.dart';

class HomeListCharactersState extends Equatable {
  // final List<CharacterEntity> characters;
  final PeticionDetailsEntity peticionDetailsEntity;
  final int page;
  const HomeListCharactersState({
    this.peticionDetailsEntity = const PeticionDetailsEntity(
      characters: [],
      count: 1,
      next: '',
      prev: '',
      error: '',
    ),
    this.page = 0,
  });

  HomeListCharactersState copyWith({
    PeticionDetailsEntity? peticionDetailsEntity,
    required int page,
  }) {
    return HomeListCharactersState(
      peticionDetailsEntity:
          peticionDetailsEntity ?? this.peticionDetailsEntity,
      page: page,
    );
  }

  int get nextPage => page + 1;

  @override
  List<Object> get props => [peticionDetailsEntity, page];
}
