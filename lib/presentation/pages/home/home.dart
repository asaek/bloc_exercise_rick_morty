import 'package:bloc_rick_morty/presentation/helpers/snack_bar_rick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../bloc/blocs.dart';
import '../../bloc/home_list_characters_bloc/home_list_characters_bloc.dart';
import 'widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  static const routerName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppBarRick(),
          _ListCharacters(),
        ],
      ),
    );
  }
}
// ! hay que hacer un scaffoldButtonFloating para el boton de busqueda

class _ListCharacters extends StatefulWidget {
  const _ListCharacters({
    super.key,
  });

  @override
  State<_ListCharacters> createState() => _ListCharactersState();
}

class _ListCharactersState extends State<_ListCharacters> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    context.read<HomeListCharactersBloc>().fetchInitialCharacters();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 400 >=
          _scrollController.position.maxScrollExtent) {
        final bool isLoading = context.read<HomeListCharactersBloc>().isLoading;
        if (!isLoading) {
          context.read<HomeListCharactersBloc>().fetchInitialCharacters();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeListCharactersBloc, HomeListCharactersState>(
        builder: (context, state) {
          final List<CharacterEntity> peticionDetailsEntity =
              state.peticionDetailsEntity.characters;

          final String? errores = state.peticionDetailsEntity.error;
          if (peticionDetailsEntity.isEmpty) {
            return Center(
              child: Image.asset(
                'assets/images/portal_3.gif',
                fit: BoxFit.cover,
              ),
            );
          }

          if (errores != null) {
            SnackBar snackBar = snackBarRick(
              errores: errores,
              imagen: 'assets/images/pepinillo_rick.png',
            );
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          }

          return GridView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: peticionDetailsEntity.length,
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.69,
            ),
            itemBuilder: (BuildContext context, int index) {
              return TarjetaPersonaje(
                characterEntity: peticionDetailsEntity[index],
                index: index,
              );
            },
          );
        },
      ),
    );
  }
}
