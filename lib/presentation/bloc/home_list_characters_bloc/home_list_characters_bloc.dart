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
  bool _isDetailSearch = false;
  ParametersSearchingEntity _parametersSearching = ParametersSearchingEntity(
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
    if (state.peticionDetailsEntity.next == null && !_isDetailSearch) {
      emit(
        state.copyWith(
          peticionDetailsEntity: PeticionDetailsEntity(
            characters: state.peticionDetailsEntity.characters,
            count: state.peticionDetailsEntity.count,
            next: state.peticionDetailsEntity.next,
            prev: state.peticionDetailsEntity.prev,
            page: state.peticionDetailsEntity.page,
            isDetailSearch: false,
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
      searchingParameters: ParametersSearchingEntity(
        page: event.parametersSearching.page,
        gender: event.parametersSearching.gender,
        status: event.parametersSearching.status,
        species: event.parametersSearching.species,
        nombre: event.parametersSearching.nombre,
        type: event.parametersSearching.type,
      ),
    );
    print(peticionfetchCharacters);
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
                isDetailSearch: state.peticionDetailsEntity.isDetailSearch,
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
                isDetailSearch: peticionfetchCharacters.isDetailSearch,
              ),
              pageActual: event.parametersSearching.page,
            ),
          );
    await Future.delayed(const Duration(milliseconds: 500));
    _isLoading = false;
  }

  bool get isLoading => _isLoading;

  // ? llamado a Eventos
  // * Searching Characters
  void searchCharacters({required bool isDetailSearch}) {
    state.resetCharacters();
    _isDetailSearch = isDetailSearch;
    add(FetchCharactersEvent(
      parametersSearching: ParametersSearchingEntity(
        page: 1,
        nombre: _parametersSearching.nombre,
        gender: _parametersSearching.gender,
        status: _parametersSearching.status,
        species: _parametersSearching.species,
        type: _parametersSearching.type,
      ),
    ));
  }

  void resetHistorySearch() {
    _parametersSearching = ParametersSearchingEntity(
      page: 1,
      nombre: null,
      gender: null,
      status: null,
      species: null,
      type: null,
    );
  }

  // * Llamado al hacer scroll
  void scrollingCall({required bool isDetailSearch}) {
    _isDetailSearch = isDetailSearch;
    add(
      FetchCharactersEvent(
        parametersSearching: ParametersSearchingEntity(
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
        parametersSearching: ParametersSearchingEntity(
          page: 1,
          // nombre: _parametersSearching.nombre,
        ),
      ),
    );
  }

  //! Comunicacion de blocs
  // * Guardado de busqueda con comunicacion de blocs
  void streamTextSearch(String? text) {
    _parametersSearching.nombre = text;
  }

  void streamType(String? type) {
    _parametersSearching.type = type;
  }

  void streamStatus(Statuss status) {
    if (status != Statuss.selecciona) {
      _parametersSearching.status = status;
    } else {
      _parametersSearching.status = null;
    }
  }

  void streamSpecies(Species species) {
    if (species != Species.selecciona) {
      _parametersSearching.species = species;
    } else {
      _parametersSearching.species = null;
    }
  }

  void streamGender(Gender gender) {
    if (gender != Gender.selecciona) {
      _parametersSearching.gender = gender;
    } else {
      _parametersSearching.gender = null;
    }
  }

  //? este es una prueba para ver como se conporta la comunicacion entre el blocs
  void theyAreSearch(bool? inSearch) {
    print(inSearch);
  }
}
