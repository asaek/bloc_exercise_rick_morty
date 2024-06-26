import 'package:bloc_rick_morty/data/data_sources_impl/location_character_datasource_impl/location_character_datasource_impl.dart';
import 'package:bloc_rick_morty/presentation/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/data_sources_impl/data_sources_impl.dart';
import '../../data/repositories_impl/repositories_impl.dart';
import '../../domain/data_sources/data_sources.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/use_cases/use_cases.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  //? Data Source
  locator.registerLazySingleton<PeticionDetailsDataSource>(
      () => PeticionDetailsDataSourceImpl());

  locator.registerLazySingleton<LocationCharacterDataSource>(() =>
      LocationCharacterDataSourceImpl(
          getCharacterDataSource: locator<GetCharacterDataSource>()));

  locator.registerLazySingleton<GetCharacterDataSource>(
      () => GetCharacterDataSourceImpl());

  //? Repository
  locator.registerLazySingleton<PeticionDetailsRepository>(
    () => PeticionDetailsRepositoryImpl(
        peticionDetailsDataSource: locator<PeticionDetailsDataSource>()),
  );

  locator.registerLazySingleton<LocationCharacterRepository>(
    () => LocationCharacterRepositoryImpl(
        locationCharacterDataSource: locator<LocationCharacterDataSource>()),
  );

  //? UseCase
  locator.registerLazySingleton<FetchCharactersUseCase>(() =>
      FetchCharactersUseCaseImpl(
          peticionDetailsRepository: locator<PeticionDetailsRepository>()));

  locator.registerLazySingleton<FetchLocationUseCase>(() =>
      FetchLocationUseCaseImpl(
          locationCharacterRepository: locator<LocationCharacterRepository>()));

  //?  blocs
  locator.registerSingleton<HomeListCharactersBloc>(HomeListCharactersBloc(
    fetchCharactersUseCaseImpl: locator<FetchCharactersUseCase>(),
    // seachCharacterUseCaseImpl: locator<SeachCharacterUseCase>(),
  ));

  //?  cubits
  locator.registerSingleton<ThemeCubit>(ThemeCubit());

  locator.registerSingleton<LocationCharactersCubit>(LocationCharactersCubit(
    locationCharacterUserCase: locator<FetchLocationUseCase>(),
  ));

  locator.registerSingleton<CharacterSelectedBloc>(CharacterSelectedBloc());

  //* cubits con comunicacion al bloc

  locator.registerSingleton<StatusDropCubit>(StatusDropCubit(
    statusForSearch: locator<HomeListCharactersBloc>().streamStatus,
  ));
  locator.registerSingleton<GeneroDropCubitCubit>(GeneroDropCubitCubit(
    genderForSearch: locator<HomeListCharactersBloc>().streamGender,
  ));
  locator.registerSingleton<SpeciesDropCubit>(SpeciesDropCubit(
    speciesForSearch: locator<HomeListCharactersBloc>().streamSpecies,
  ));

  locator.registerSingleton<SearchBarCubit>(SearchBarCubit(
      theyAreSearching: locator<HomeListCharactersBloc>().theyAreSearch));

  locator.registerSingleton<StringForSearchCubit>(StringForSearchCubit(
      stringForSearch: locator<HomeListCharactersBloc>().streamTextSearch));

  locator.registerSingleton<TypeForSearchCubit>(TypeForSearchCubit(
      typeForSearch: locator<HomeListCharactersBloc>().streamType));

  //! Extras
  //? ScrollControllers
  locator.registerLazySingleton<ScrollController>(() => ScrollController());
  locator.registerLazySingleton<TextEditingController>(
    () => TextEditingController(),
    instanceName: 'searchCharacter',
  );
  locator.registerLazySingleton<TextEditingController>(
    () => TextEditingController(),
    instanceName: 'searchType',
  );
}
