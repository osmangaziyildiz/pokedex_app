import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex_app/constants/ui_helper.dart';
import 'package:poke_dex_app/models/pokemon_model.dart';
import 'package:poke_dex_app/widgets/pokemon_detail_page_topside.dart';
import 'package:poke_dex_app/widgets/pokemon_information.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildForPotraitMode(context)
        : _buildForLandscapeMode(context);
  }

  Scaffold _buildForPotraitMode(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: UIHelper.getDefaultPadding(),
              iconSize: UIHelper.getIconSize(),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            PokemonDetailPageTopSide(pokemon: pokemon),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: ScreenUtil().orientation == Orientation.portrait
                        ? 0.12.sh
                        : 0.06.sh,
                    right: 0,
                    bottom: 0,
                    child: PokemonInformation(pokemon: pokemon),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: pokemon.id!,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img!,
                        height: 0.25.sh,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildForLandscapeMode(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: UIHelper.getDefaultPadding(),
              iconSize: UIHelper.getIconSize(),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        PokemonDetailPageTopSide(pokemon: pokemon),
                        Hero(
                          tag: pokemon.id!,
                          child: CachedNetworkImage(
                            imageUrl: pokemon.img!,
                            height: 0.25.sw,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: PokemonInformation(pokemon: pokemon),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
