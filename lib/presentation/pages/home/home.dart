import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routerName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ImagenAppbar(),
                  // const Spacer(
                  //   flex: 2,
                  // ),
                  _TitleImage(),
                  Spacer(
                      // flex: 8,
                      ),
                  _IconButton(),
                ],
              ),
            ),
          ),
        ],
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
      onPressed: () {},
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
