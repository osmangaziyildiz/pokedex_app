import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex_app/models/pokemon_model.dart';
import 'package:poke_dex_app/services/pokedex_api.dart';
import 'package:poke_dex_app/widgets/pokemon_list_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _futureList;

  @override
  void initState() {
    super.initState();
    _futureList = PokedexApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _futureList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> myList = snapshot.data!;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 4),
            itemCount: myList.length,
            itemBuilder: (BuildContext context, int index) {
              return PokeListItem(pokemon: myList[index]);
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
