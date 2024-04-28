import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/use_cases/use_cases.dart';

part 'location_characters_state.dart';

class LocationCharactersCubit extends Cubit<LocationCharactersState> {
  LocationOriginEntity? locationOriginEntity;

  final FetchLocationUseCase locationCharacterUserCase;
  LocationCharactersCubit({required this.locationCharacterUserCase})
      : super(LocationCharactersInitial());

  void _loadLocationCharacters(
      {required LocationOriginEntity locationOriginEntity}) {
    emit(LocationCharactersLoaded(locationOriginEntity: locationOriginEntity));
  }

  void loadLocationCharacters({required OriginAndLocationEntity origin}) async {
    emit(LocationCharactersLoading());

    locationCharacterUserCase
        .callLocation(locationUrl: origin.url)
        .then((value) {
      print(value);
      locationOriginEntity = value;
      _loadLocationCharacters(locationOriginEntity: locationOriginEntity!);
    });
  }
}
