import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex_app/constants/constants.dart';
import 'package:poke_dex_app/models/pokemon_model.dart';

class PokemonDetailPageTopSide extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonDetailPageTopSide({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ScreenUtil().orientation == Orientation.portrait
          ? EdgeInsets.symmetric(horizontal: 0.10.sw)
          : EdgeInsets.symmetric(horizontal: 0.03.sw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(pokemon.name!, style: Constants.pokemonNameTextStyle),
              Text(
                "#${pokemon.num}",
                style: Constants.pokemonNameTextStyle,
              )
            ],
          ),
          Chip(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            label: Text(
              pokemon.type!.join(" , "),
              style: Constants.pokemonTypeTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
