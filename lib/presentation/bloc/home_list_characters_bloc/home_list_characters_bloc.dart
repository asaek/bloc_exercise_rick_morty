import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';

part 'home_list_characters_event.dart';
part 'home_list_characters_state.dart';

class HomeListCharactersBloc
    extends Bloc<HomeListCharactersEvent, HomeListCharactersState> {
  HomeListCharactersBloc() : super(const HomeListCharactersState()) {
    on<HomeListCharactersEvent>(_onFetchCharacters);
  }
  void _onFetchCharacters(
      HomeListCharactersEvent event, Emitter<HomeListCharactersState> emit) {
    emit(state.copyWith(peticionDetailsEntity:,),);
  }
}
