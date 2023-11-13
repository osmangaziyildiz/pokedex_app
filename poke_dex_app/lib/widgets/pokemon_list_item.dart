import 'package:flutter/material.dart';
import 'package:poke_dex_app/constants/constants.dart';
import 'package:poke_dex_app/constants/ui_helper.dart';
import 'package:poke_dex_app/models/pokemon_model.dart';
import 'package:poke_dex_app/pages/pokemon_detail_page.dart';
import 'package:poke_dex_app/widgets/pokemon_image.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeListItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return PokemonDetailPage(pokemon: pokemon);
            },
          ),
        );
      },
      child: Card(
        elevation: 3,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 8),
                child:
                    Text(pokemon.name!, style: Constants.pokemonNameTextStyle)),
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: Chip(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                label: Text(pokemon.type![0],
                    style: Constants.pokemonTypeTextStyle),
              ),
            ),
            PokemonImage(pokemon: pokemon),
          ],
        ),
      ),
    );
  }
}
