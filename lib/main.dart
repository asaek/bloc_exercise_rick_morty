import 'package:bloc_rick_morty/config/go_router/router.dart';
import 'package:bloc_rick_morty/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bloc/blocs.dart';
import 'presentation/bloc/service_locator.dart';

void main() {
  setupLocator();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => locator<ThemeCubit>(),
        ),
        BlocProvider<SearchBarCubit>(
          create: (BuildContext context) => locator<SearchBarCubit>(),
        ),
        BlocProvider<HomeListCharactersBloc>(
          create: (BuildContext context) => locator<HomeListCharactersBloc>(),
        ),
        BlocProvider<CharacterSelectedBloc>(
          create: (BuildContext context) => locator<CharacterSelectedBloc>(),
        ),
        BlocProvider<StringForSearchCubit>(
          create: (BuildContext context) => locator<StringForSearchCubit>(),
        ),
        BlocProvider<GeneroDropCubitCubit>(
          create: (BuildContext context) => locator<GeneroDropCubitCubit>(),
        ),
        BlocProvider<StatusDropCubit>(
          create: (BuildContext context) => locator<StatusDropCubit>(),
        ),
        BlocProvider<SpeciesDropCubit>(
          create: (BuildContext context) => locator<SpeciesDropCubit>(),
        ),
        BlocProvider<TypeForSearchCubit>(
          create: (BuildContext context) => locator<TypeForSearchCubit>(),
        ),
        BlocProvider<LocationCharactersCubit>(
          create: (BuildContext context) => locator<LocationCharactersCubit>(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dartTheme = context.watch<ThemeCubit>().state.isDarkMode;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Rck & Morty',
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: dartTheme).getTheme(),
    );
  }
}
