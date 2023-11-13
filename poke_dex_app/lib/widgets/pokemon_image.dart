import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex_app/models/pokemon_model.dart';

class PokemonImage extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonImage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,
        child: Hero(
          tag: pokemon.id!,
          child: CachedNetworkImage(
            imageUrl: pokemon.img!,
            fit: BoxFit.contain,
            width: 100,
            height: 100,
            placeholder: (context, url) {
              return const CircularProgressIndicator(
                color: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}
