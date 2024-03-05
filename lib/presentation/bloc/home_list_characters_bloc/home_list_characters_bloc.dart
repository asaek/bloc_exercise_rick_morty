import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/use_cases/use_cases.dart';

part 'home_list_characters_event.dart';
part 'home_list_characters_state.dart';

class HomeListCharactersBloc
    extends Bloc<HomeListCharactersEvent, HomeListCharactersState> {
  final FetchCharactersUseCase fetchCharactersUseCaseImpl;
  bool _isLoading = false;
  final ParametersSearching _parametersSearching = ParametersSearching(
    page: 0,
    nombre: null,
    gender: null,
    status: null,
    species: null,
    type: null,
  );

  HomeListCharactersBloc({
    required this.fetchCharactersUseCaseImpl,
  }) : super(const HomeListCharactersState()) {
    on<FetchCharactersEvent>(_onFetchCharacters);
  }
  void _onFetchCharacters(
      FetchCharactersEvent event, Emitter<HomeListCharactersState> emit) async {
    if (state.peticionDetailsEntity.next == null) {
      emit(
        state.copyWith(
          peticionDetailsEntity: PeticionDetailsEntity(
            characters: state.peticionDetailsEntity.characters,
            count: state.peticionDetailsEntity.count,
            next: state.peticionDetailsEntity.next,
            prev: state.peticionDetailsEntity.prev,
            page: state.peticionDetailsEntity.page,
            error: 'Ya no hay mas personajes',
          ),
          // ! Creo que la pagina actual esta mal
          pageActual: event.parametersSearching.page,
        ),
      );
      return;
    }

    _isLoading = true;

    final PeticionDetailsEntity peticionfetchCharacters =
        await fetchCharactersUseCaseImpl.callCharacters(
      searchingParameters: ParametersSearching(
        page: event.parametersSearching.page,
        gender: null,
        status: null,
        species: null,
        nombre: event.parametersSearching.nombre,
        type: event.parametersSearching.type,
      ),
    );
    // ! falta agregar los demas filtros y terminamos la busqueda

    (peticionfetchCharacters.error != null)
        ? emit(
            state.copyWith(
              peticionDetailsEntity: PeticionDetailsEntity(
                characters: state.peticionDetailsEntity.characters,
                count: state.peticionDetailsEntity.count,
                next: state.peticionDetailsEntity.next,
                prev: state.peticionDetailsEntity.prev,
                page: state.peticionDetailsEntity.page,
                error: peticionfetchCharacters.error,
              ),
              pageActual: event.parametersSearching.page,
            ),
          )
        : emit(
            state.copyWith(
              peticionDetailsEntity: PeticionDetailsEntity(
                characters: [
                  ...state.peticionDetailsEntity.characters,
                  ...peticionfetchCharacters.characters,
                ],
                count: peticionfetchCharacters.count,
                next: peticionfetchCharacters.next,
                prev: peticionfetchCharacters.prev,
                page: peticionfetchCharacters.page,
              ),
              pageActual: event.parametersSearching.page,
            ),
          );
    await Future.delayed(const Duration(milliseconds: 500));
    _isLoading = false;
  }

  bool get isLoading => _isLoading;

  // ? llamado a los Eventos
  // * Searching Characters
  void searchCharacters() {
    state.resetCharacters();
    add(FetchCharactersEvent(
      parametersSearching: ParametersSearching(
        page: 1,
        nombre: _parametersSearching.nombre,
        gender: null,
        status: null,
        species: null,
        type: _parametersSearching.type,
      ),
    ));
  }

  // * Llamado al hacer scroll
  void scrollingCall() {
    add(
      FetchCharactersEvent(
        parametersSearching: ParametersSearching(
          page: state.nextPage,
          nombre: _parametersSearching.nombre,
          gender: _parametersSearching.gender,
          status: _parametersSearching.status,
          species: _parametersSearching.species,
          type: _parametersSearching.type,
        ),
      ),
    );
  }

  // * Llamando por primera ves
  void fetchInitialCharacters() {
    add(
      FetchCharactersEvent(
        parametersSearching: ParametersSearching(
          page: 1,
          nombre: _parametersSearching.nombre,
        ),
      ),
    );
  }

  // * Guardado de busqueda con comunicacion de blocs
  void streamTextSearch(String text) {
    _parametersSearching.nombre = text;
  }

  void streamType(String type) {
    _parametersSearching.type = type;
  }

  //? este es una prueba para ver como se conporta la comunicacion entre el blocs
  void theyAreSearch(bool? inSearch) {
    print(inSearch);
  }
}
