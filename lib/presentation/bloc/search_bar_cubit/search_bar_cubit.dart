import 'package:bloc/bloc.dart';

typedef TheyAreSearching = void Function(bool);

class SearchBarCubit extends Cubit<bool> {
  final TheyAreSearching? theyAreSearching;

  SearchBarCubit({this.theyAreSearching}) : super(false);

  void changeSearchBar() {
    emit(!state);
    theyAreSearching?.call(state);
  }
}
