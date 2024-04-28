part of 'home_list_characters_bloc.dart';

class HomeListCharactersState extends Equatable {
  // final List<CharacterEntity> characters;
  final PeticionDetailsEntity peticionDetailsEntity;
  final int pageActual;
  const HomeListCharactersState({
    this.peticionDetailsEntity = const PeticionDetailsEntity(
      characters: [],
      count: 1,
      next: '',
      prev: '',
      page: 0,
      isDetailSearch: false,
    ),
    this.pageActual = 0,
  });

  HomeListCharactersState copyWith({
    PeticionDetailsEntity? peticionDetailsEntity,
    required int pageActual,
  }) {
    return HomeListCharactersState(
      peticionDetailsEntity:
          peticionDetailsEntity ?? this.peticionDetailsEntity,
      pageActual: pageActual,
    );
  }

  int get nextPage => pageActual + 1;

  void resetCharacters() {
    peticionDetailsEntity.characters.clear();
  }

  @override
  List<Object> get props => [peticionDetailsEntity, pageActual];
}
