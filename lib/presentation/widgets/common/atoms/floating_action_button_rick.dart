import 'package:bloc_rick_morty/domain/entities/entities.dart';
import 'package:bloc_rick_morty/presentation/bloc/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';
import '../tokens/border_radius.dart';
import '../tokens/colores.dart';

class FloatingActionButtonRick extends StatelessWidget {
  const FloatingActionButtonRick({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.search),
      onPressed: () {
        // context.read<SearchBarCubit>().changeSearchBar();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Buscar personaje',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        const NameSearchTexfield(),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text('Genero'),
                                GenderDropDownButton(),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Estado'),
                                StatusDropDownButton(),
                              ],
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            Text('Especie'),
                            EspecieDropDownButton(),
                          ],
                        ),
                        const TypeSearchTexfield(),
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ModalButton(
                        text: 'Cancelar',
                        color: cancelarColor,
                        isAccept: false,
                      ),
                      // Spacer(),
                      ModalButton(
                        text: 'Buscar',
                        color: aceptarColor,
                        isAccept: true,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class EspecieDropDownButton extends StatelessWidget {
  const EspecieDropDownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeciesDropCubit, SpeciesDropCubitState>(
      builder: (context, state) {
        final Species species = state.species;
        return DropdownButton<Species>(
          value: species,
          onChanged: (Species? newValue) {
            context.read<SpeciesDropCubit>().changeSpecies(species: newValue!);
          },
          items: Species.values.map<DropdownMenuItem<Species>>((Species value) {
            return DropdownMenuItem<Species>(
              value: value,
              child: Text(value.toString().split('.').last),
            );
          }).toList(),
        );
      },
    );
  }
}

class StatusDropDownButton extends StatelessWidget {
  const StatusDropDownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatusDropCubit, StatusDropCubitCubitState>(
      builder: (context, state) {
        final Statuss status = state.status;
        return DropdownButton<Statuss>(
          value: status,
          onChanged: (Statuss? newValue) {
            context.read<StatusDropCubit>().changeValue(status: newValue!);
          },
          items: Statuss.values.map<DropdownMenuItem<Statuss>>((Statuss value) {
            return DropdownMenuItem<Statuss>(
              value: value,
              child: Text(value.toString().split('.').last),
            );
          }).toList(),
        );
      },
    );
  }
}

class GenderDropDownButton extends StatelessWidget {
  const GenderDropDownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneroDropCubitCubit, Gender>(
      builder: (context, state) {
        return DropdownButton<Gender>(
          value: state,
          onChanged: (Gender? newValue) {
            context.read<GeneroDropCubitCubit>().changeValue(gender: newValue!);
          },
          items: Gender.values.map<DropdownMenuItem<Gender>>((Gender value) {
            return DropdownMenuItem<Gender>(
              value: value,
              child: Text(value.toString().split('.').last),
            );
          }).toList(),
        );
      },
    );
  }
}

class NameSearchTexfield extends StatelessWidget {
  const NameSearchTexfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      focusNode: FocusNode(),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Search character',
        enabledBorder: InputBorder.none,
      ),
      onChanged: (val) {
        context.read<StringForSearchCubit>().changeStringForSearch(value: val);
      },
    );
  }
}

class TypeSearchTexfield extends StatelessWidget {
  const TypeSearchTexfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      focusNode: FocusNode(),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Search Type',
        enabledBorder: InputBorder.none,
      ),
      onChanged: (val) {
        context.read<TypeForSearchCubit>().changeTypeForSearch(value: val);
      },
    );
  }
}

class ModalButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool isAccept;
  const ModalButton({
    super.key,
    required this.text,
    required this.color,
    required this.isAccept,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 100,
      child: Material(
        color: color,
        borderRadius: (isAccept)
            ? const BorderRadius.only(
                bottomRight: modalBorderOnlyRadius,
                topLeft: modalBorderOnlyRadius,
              )
            : const BorderRadius.only(
                bottomLeft: modalBorderOnlyRadius,
                topRight: modalBorderOnlyRadius,
              ),
        child: InkWell(
          onTap: () {
            if (isAccept) {
              context.read<HomeListCharactersBloc>().searchCharacters();
              locator<ScrollController>().animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            } else {
              // * Cancelar
            }
            Navigator.pop(context);
          },
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}
