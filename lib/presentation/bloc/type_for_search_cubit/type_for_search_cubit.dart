import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'type_for_search_state.dart';

typedef TypeForSearch = void Function(String value);

class TypeForSearchCubit extends Cubit<TypeForSearchState> {
  final TypeForSearch? typeForSearch;

  TypeForSearchCubit({this.typeForSearch}) : super(const TypeForSearchState());

  void changeTypeForSearch({required String value}) {
    emit(state.copyWith(typeForSearch: value));
    typeForSearch?.call(value);
  }
}
