import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/blocs.dart';

class HomePage extends StatelessWidget {
  static const routerName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _AppBar(),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return _TarjetaPersonaje(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TarjetaPersonaje extends StatelessWidget {
  final int index;
  const _TarjetaPersonaje({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: Colors.teal[100 * (index % 9)],
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.greenAccent[400],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Material(
                    color: Colors.orange,
                    child: Image.asset(
                      'assets/images/pepinillo_rick_2.png',
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ),
              Text(
                'Nombre $index',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(left: 5),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _ImagenAppbar(),
            _TitleImage(),
            Spacer(),
            _IconButton(),
          ],
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50,
      icon: const Icon(
        Icons.light_mode_outlined,
      ),
      onPressed: () {
        context.read<ThemeCubit>().toggleTheme();
      },
    );
  }
}

class _TitleImage extends StatelessWidget {
  const _TitleImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/title.png', width: 250, height: 80);
  }
}

class _ImagenAppbar extends StatelessWidget {
  const _ImagenAppbar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Image.asset(
      'assets/images/rick_morty_dedos2.png',
      width: size.width * 0.2,
    );
  }
}
