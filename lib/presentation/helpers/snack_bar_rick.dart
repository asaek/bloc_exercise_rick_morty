import 'package:flutter/material.dart';

SnackBar snackBarRick({required String errores, required String imagen}) {
  return SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          errores,
          style: const TextStyle(fontSize: 22),
        ),
        Image.asset(
          imagen,
          width: 60,
        ),
      ],
    ),
  );
}
