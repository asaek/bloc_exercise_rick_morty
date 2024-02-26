import 'package:bloc_rick_morty/presentation/bloc/blocs.dart';
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

  //? Repository
  locator.registerLazySingleton<PeticionDetailsRepository>(
    () => PeticionDetailsRepositoryImpl(
        peticionDetailsDataSource: locator<PeticionDetailsDataSource>()),
  );

  //? UseCase
  locator.registerLazySingleton<FetchCharactersUseCase>(() =>
      FetchCharactersUseCaseImpl(
          peticionDetailsRepository: locator<PeticionDetailsRepository>()));

  //?  blocs
  locator.registerSingleton(ThemeCubit());
  locator.registerSingleton<HomeListCharactersBloc>(HomeListCharactersBloc(
      fetchCharactersUseCaseImpl: locator<FetchCharactersUseCase>()));
}


//! leer lo de chatGPT y modificar todas las inyecciones de dependencias
//! gracias GetIT ya no se inyecta las implementaciones si no las abstracciones de las clases
//! modificar repository datasource y usecase de esta manera