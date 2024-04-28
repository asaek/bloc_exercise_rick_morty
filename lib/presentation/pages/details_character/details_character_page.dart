import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../bloc/blocs.dart';
import '../../helpers/colores_stributos.dart';
import '../../widgets/widgets.dart';

class CharaceterDetailsPage extends StatelessWidget {
  static const routerName = '/character_d';

  const CharaceterDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CharacterSelectedBloc, CharacterSelectedState>(
        builder: (context, state) {
          if (state is CharacterSelectedInitial) {
            // print('state.characterEntity: ${state.characterEntity}');
            final CharacterEntity character = state.characterEntity!;
            final LocationOriginEntity? locationOriginEntity =
                context.read<LocationCharactersCubit>().locationOriginEntity;

            if (locationOriginEntity == null) {
              context.read<LocationCharactersCubit>().loadLocationCharacters(
                    origin: character.origin,
                  );
            } else {
              if (locationOriginEntity.name != character.origin.name) {
                context.read<LocationCharactersCubit>().loadLocationCharacters(
                      origin: character.origin,
                    );
              }
            }

            return CustomScrollView(
              slivers: <Widget>[
                _SliverAppBar(
                  image: character.image,
                  name: character.name,
                  status: character.status,
                ),
                _AttributesBody(character: character),
                // const _PersonajesPlaneta(),
                const _LocationListCharacters(),
                // SliverList(
                //   delegate: SliverChildBuilderDelegate(
                //     (context, index) => ListTile(title: Text('Ítem #$index')),
                //     childCount: 100, // Número de ítems en la lista
                //   ),
                // ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class _LocationListCharacters extends StatelessWidget {
  const _LocationListCharacters();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              'Personajes del planeta:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 300, // Altura fija para el ListView horizontal
            child:
                BlocBuilder<LocationCharactersCubit, LocationCharactersState>(
              builder: (context, state) {
                if (state is LocationCharactersLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is LocationCharactersLoaded) {
                  final LocationOriginEntity locationOriginEntity =
                      state.locationOriginEntity;
                  if (locationOriginEntity.error != null) {
                    return Center(
                      child: Text(
                        locationOriginEntity.error!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: locationOriginEntity.residents!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          width: 150,
                          child: TarjetaPersonaje(
                            index: index,
                            characterEntity:
                                locationOriginEntity.residents![index],
                          ),
                        ),
                      );
                      // return SizedBox(
                      //   width: 200, // Ancho fijo para cada íte
                      //   child: Card(
                      //     child: Center(
                      //       child: Text(
                      //           'Ítem #${locationOriginEntity.residents![index]}'),
                      //     ),
                      //   ),
                      // );
                    },
                  );
                }

                return const Center(
                  child: Text('Error al cargar los personajes del planeta'),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _AttributesBody extends StatelessWidget {
  final CharacterEntity character;
  const _AttributesBody({required this.character});

  @override
  Widget build(BuildContext context) {
    final Color speciesColor = colorRaza(specie: character.species);
    final Color genderColor = colorGender(gender: character.gender);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Material(
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Detalles del personaje',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Divider(),
                  _NombreStatus(character: character),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: speciesColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              character.species,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ),
                      // const Spacer(),
                      SizedBox(
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: genderColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              character.gender,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ),
                      // const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 10),

                  Text(
                    character.type,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Divider(),

                  // const SizedBox(height: 20),
                  Text(
                    'Planeta de origen:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // const SizedBox(height: 20),
                  // const Divider(),
                  Text(
                    character.origin.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // Text(
                  //   character.origin.url,
                  //   style: Theme.of(context).textTheme.titleLarge,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NombreStatus extends StatelessWidget {
  const _NombreStatus({
    required this.character,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          character.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        SizedBox(
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            color: (character.status == true) ? Colors.greenAccent : Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                (character.status == true) ? '  Alive  ' : '  Dead  ',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  final String image;
  final String name;
  final bool status;
  const _SliverAppBar({
    required this.image,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400.0, // Altura máxima cuando está expandido
      floating: false,
      pinned:
          true, // Se queda "pinned" en la parte superior cuando se hace scroll hacia abajo
      flexibleSpace: FlexibleSpaceBar(
        title: Material(
          borderRadius: BorderRadius.circular(15),
          color: (status == true)
              ? Colors.green.withOpacity(0.6)
              : Colors.red.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              name,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        background: Image.network(
          image,
          fit: BoxFit.cover,
        ), // Imagen de fondo del AppBar
      ),
    );
  }
}
