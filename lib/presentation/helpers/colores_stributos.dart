import 'package:flutter/material.dart';

Color colorRaza({required String specie}) {
  // enum Species { human, alien, humanoid, unknown }

  if (specie == 'Human') {
    return Colors.green;
  } else if (specie == 'Alien') {
    return Colors.orange;
  } else if (specie == 'Humanoid') {
    return Colors.blue;
  } else {
    return Colors.grey;
  }
}

Color colorGender({required String gender}) {
  // enum Gender { female, male, genderless, unknown }

  switch (gender) {
    case 'Female':
      return Colors.pinkAccent;
    case 'Male':
      return Colors.blue;
    case 'Genderless':
      return Colors.yellow;
    default:
      return Colors.grey;
  }
}
