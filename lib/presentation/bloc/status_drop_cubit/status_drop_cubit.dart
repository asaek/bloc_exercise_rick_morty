import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';

part 'status_drop_cubit_state.dart';

typedef StatusForSearch = void Function(Statuss value);

class StatusDropCubit extends Cubit<StatusDropCubitCubitState> {
  final StatusForSearch? statusForSearch;
  StatusDropCubit({
    Statuss status = Statuss.selecciona,
    this.statusForSearch,
  }) : super(StatusDropCubitCubitState(status: status));

  void changeValue({required Statuss status}) {
    emit(StatusDropCubitCubitState(status: status));
    statusForSearch?.call(status);
  }
}
