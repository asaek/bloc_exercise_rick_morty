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

  HomeListCharactersBloc({required this.fetchCharactersUseCaseImpl})
      : super(const HomeListCharactersState()) {
    on<FetchCharactersEvent>(_onFetchCharacters);
    // on<FetchNextCharactersEvent>(_onFetchNextCharacters);
  }
  void _onFetchCharacters(
      FetchCharactersEvent event, Emitter<HomeListCharactersState> emit) async {
    final nextPage = state.nextPage;

    late PeticionDetailsEntity peticionfetchCharacters;
    print(state.nextPage);
    // if (_isLoading) return;
    _isLoading = true;
    if (nextPage <= 43) {
      peticionfetchCharacters =
          await fetchCharactersUseCaseImpl.callCharacters(page: nextPage);
      emit(
        state.copyWith(
          peticionDetailsEntity: PeticionDetailsEntity(
            characters: [
              ...state.peticionDetailsEntity.characters,
              ...peticionfetchCharacters.characters,
            ],
            count: peticionfetchCharacters.count,
            next: peticionfetchCharacters.next,
            prev: peticionfetchCharacters.prev,
          ),
          page: nextPage,
        ),
      );
      _isLoading = false;
    } else {
      emit(
        state.copyWith(
          peticionDetailsEntity: PeticionDetailsEntity(
              characters: state.peticionDetailsEntity.characters,
              count: state.peticionDetailsEntity.count,
              next: state.peticionDetailsEntity.next,
              prev: state.peticionDetailsEntity.prev,
              error: 'No more characters to show'),
          page: 43,
        ),
      );
    }
  }

  bool get isLoading => _isLoading;

  // ? llamado a los Eventos
  // * Llamando a los personajes
  void fetchInitialCharacters() {
    add(const FetchCharactersEvent());
  }
}
