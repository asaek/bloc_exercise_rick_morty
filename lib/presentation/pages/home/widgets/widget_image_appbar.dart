import 'package:flutter/material.dart';

class ImagenAppbar extends StatelessWidget {
  const ImagenAppbar({
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
