import 'package:flutter/material.dart';
import 'package:poke_dex_app/constants/constants.dart';
import 'package:poke_dex_app/constants/ui_helper.dart';
import 'package:poke_dex_app/models/pokemon_model.dart';

class PokemonInformation extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonInformation({super.key, required this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _informationCategories("Name", pokemon.name!),
            _informationCategories("Height", pokemon.height!),
            _informationCategories("Weight", pokemon.weight!),
            _informationCategories("Spawn Time", pokemon.spawnTime!),
            _informationCategories("Weakness", pokemon.weaknesses!),
            _informationCategories("Pre Evolution", pokemon.prevEvolution),
            _informationCategories("Next Evolution", pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  Widget _informationCategories(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.pokemonCategoriesTextStyle,
        ),
        if (value is List && value.isNotEmpty)
          Text(value.join(" , "))
        else if (value.isEmpty)
          const Text("Not Available")
        else
          Text(value.toString())
      ],
    );
  }
}
