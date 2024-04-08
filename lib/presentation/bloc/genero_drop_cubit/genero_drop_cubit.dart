import 'package:bloc/bloc.dart';

import '../../../domain/entities/entities.dart';

typedef GenderForSearch = void Function(Gender value);

class GeneroDropCubitCubit extends Cubit<Gender> {
  final GenderForSearch? genderForSearch;

  GeneroDropCubitCubit({this.genderForSearch}) : super(Gender.male);

  void changeValue({required Gender gender}) {
    emit(gender);
    genderForSearch?.call(gender);
  }
}
