import 'package:bloc_rick_morty/presentation/helpers/snack_bar_rick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../bloc/blocs.dart';
import '../../bloc/service_locator.dart';
import '../../widgets/widgets.dart';
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
      floatingActionButton: FloatingActionButtonRick(),
    );
  }
}

class _ButtonAceptar extends StatelessWidget {
  // final TextEditingController textController;
  final bool state;
  const _ButtonAceptar({
    super.key,
    required this.state,
    // required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: state
          ? () {
              context.read<HomeListCharactersBloc>().searchCharacters();
              // textController.clear();
              // textController.dispose();
            }
          : null,
      icon: Icon(
        state ? Icons.play_arrow : Icons.close,
        color: state ? Colors.black : Colors.red,
      ),
    );
  }
}

class _ListCharacters extends StatefulWidget {
  const _ListCharacters({
    super.key,
  });

  @override
  State<_ListCharacters> createState() => _ListCharactersState();
}

class _ListCharactersState extends State<_ListCharacters> {
  final ScrollController _scrollController = locator<ScrollController>();

  @override
  void initState() {
    context.read<HomeListCharactersBloc>().fetchInitialCharacters();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 300 >=
          _scrollController.position.maxScrollExtent) {
        final bool isLoading = context.read<HomeListCharactersBloc>().isLoading;
        final String? errores = context
            .read<HomeListCharactersBloc>()
            .state
            .peticionDetailsEntity
            .error;
        if (!isLoading && errores == null) {
          // print('Entron a cargar mas personajes');
          context.read<HomeListCharactersBloc>().scrollingCall();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});

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

          // if (peticionDetailsEntity.isEmpty) {
          //   SnackBar snackBar = snackBarRick(
          //     errores: 'No se encontraron personajes con ese nombre',
          //     imagen: 'assets/images/pepinillo_rick.png',
          //   );
          //   WidgetsBinding.instance.addPostFrameCallback((_) {
          //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //   });
          // }

          print('Se esta construyendo el gridview');

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
              if (index < peticionDetailsEntity.length) {
                return TarjetaPersonaje(
                  characterEntity: peticionDetailsEntity[index],
                  index: index,
                );
              } else {
                //* Si no hay mas personajes se envian muchos sizebox al momento de
                //* hacer una busqueda personalizada
                return const SizedBox();
              }

              // return TarjetaPersonaje(
              //   characterEntity: peticionDetailsEntity[index],
              //   index: index,
              // );
            },
          );
        },
      ),
    );
  }
}
