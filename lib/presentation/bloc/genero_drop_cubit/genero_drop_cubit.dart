import 'package:bloc/bloc.dart';

import '../../../domain/entities/entities.dart';

class GeneroDropCubitCubit extends Cubit<Gender> {
  GeneroDropCubitCubit() : super(Gender.male);

  void changeValue({required Gender gender}) {
    emit(gender);
  }
}
