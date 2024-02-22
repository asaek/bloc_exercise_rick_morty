part of 'home_list_characters_bloc.dart';

class HomeListCharactersState extends Equatable {
  // final List<CharacterEntity> characters;
  final PeticionDetailsEntity peticionDetailsEntity;
  const HomeListCharactersState({
    this.peticionDetailsEntity = const PeticionDetailsEntity(
      characters: [],
      count: 1,
      next: '',
      prev: '',
      error: '',
    ),
  });

  //! Es solamente una funcion para copiar el estado actual y modificar uno o varios valores
  PeticionDetailsEntity copyWith({
    PeticionDetailsEntity? peticionDetailsEntity,
  }) {
    return PeticionDetailsEntity(
      characters: peticionDetailsEntity?.characters ??
          this.peticionDetailsEntity.characters,
      error: peticionDetailsEntity?.error ?? this.peticionDetailsEntity.error,
      count: peticionDetailsEntity?.count ?? this.peticionDetailsEntity.count,
      next: peticionDetailsEntity?.next ?? this.peticionDetailsEntity.next,
      prev: peticionDetailsEntity?.prev ?? this.peticionDetailsEntity.prev,
    );
  }

  @override
  List<Object> get props => [
        // characters,
        peticionDetailsEntity,
      ];
}
