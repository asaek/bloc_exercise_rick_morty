import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';

part 'status_drop_cubit_state.dart';

class StatusDropCubit extends Cubit<StatusDropCubitCubitState> {
  StatusDropCubit({
    Statuss status = Statuss.alive,
  }) : super(StatusDropCubitCubitState(status: status));

  void changeValue({required Statuss status}) {
    emit(StatusDropCubitCubitState(status: status));
  }
}
