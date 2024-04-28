import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'string_for_search_state.dart';

typedef StringForSearch = void Function(String? value);

class StringForSearchCubit extends Cubit<StringForSearchState> {
  final StringForSearch? stringForSearch;
  StringForSearchCubit({this.stringForSearch})
      : super(const StringForSearchState());

  void changeStringForSearch({required String? value}) {
    emit(state.copyWith(stringForSearch: value));

    stringForSearch?.call(value);
  }
}
