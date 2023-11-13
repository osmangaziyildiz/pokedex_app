import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:poke_dex_app/models/pokemon_model.dart';

class PokedexApi {
  static const String _url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> pokemonList = [];

    var result = await Dio().get(_url);
    var jsonToList = jsonDecode(result.data)["pokemon"];

    if (jsonToList is List) {
      pokemonList = jsonToList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }

    return pokemonList;
  }
}
