import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  Constants._();

  static const String appBarTitle = "Pokedex";

  static TextStyle titleTextStyle() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 45);
    }
    return const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35);
  }

  static const TextStyle pokemonNameTextStyle =
      TextStyle(color: Colors.white, fontSize: 25);

  static const TextStyle pokemonTypeTextStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10);

  static const TextStyle pokemonCategoriesTextStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
}
