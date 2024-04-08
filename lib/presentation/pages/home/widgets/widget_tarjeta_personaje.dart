import 'package:bloc_rick_morty/domain/entities/entities.dart';
import 'package:bloc_rick_morty/presentation/widgets/common/tokens/colores.dart';
import 'package:flutter/material.dart';

class TarjetaPersonaje extends StatelessWidget {
  final CharacterEntity characterEntity;
  final int index;
  const TarjetaPersonaje({
    super.key,
    required this.index,
    required this.characterEntity,
  });

  @override
  Widget build(BuildContext context) {
    final String origin = characterEntity.origin.name;
    return SizedBox(
      child: Material(
        // color: Colors.teal[100 * (index % 9)],
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              ImagenAlive(characterEntity: characterEntity),
              Text(
                characterEntity.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              // Text(
              //   characterEntity.species,
              //   textAlign: TextAlign.center,
              //   style: Theme.of(context).textTheme.titleSmall,
              // ),

              Text(
                origin,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                characterEntity.status ? 'Alive' : 'Tieso',
                style: TextStyle(
                  color: characterEntity.status ? aliveColor : deadColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(characterEntity.id.toString()),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagenAlive extends StatelessWidget {
  const ImagenAlive({
    super.key,
    required this.characterEntity,
  });

  final CharacterEntity characterEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: (characterEntity.status)
            ? Colors.greenAccent[400]
            : Colors.redAccent[400],
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Material(
          child: Image.network(
            characterEntity.image,
            fit: BoxFit.cover,
            width: 120,
            height: 120,
          ),
        ),
      ),
    );
  }
}
