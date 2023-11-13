import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();
  static double appTitleWidgetHeight =
      ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.10.sw;

  static EdgeInsets getDefaultPadding() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(10.h);
    } else {
      return EdgeInsets.all(5.w);
    }
  }

  static double getIconSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 25.h;
    } else {
      return 15.w;
    }
  }

  static final Map<String, Color> _pokemonTypeColor = {
    "Grass": Colors.green,
    "Fire": Colors.redAccent,
    "Water": Colors.blue,
    "Electric": Colors.yellow,
    "Rock": Colors.grey,
    "Ground": Colors.brown,
    "Bug": Colors.lightGreenAccent,
    "Psychic": Colors.indigo,
    "Fighting": Colors.orange,
    "Ghost": Colors.deepPurple,
    "Normal": Colors.black,
    "Poison": Colors.deepPurpleAccent
  };

  static Color getColorFromType(String type) {
    if (_pokemonTypeColor.containsKey(type)) {
      return _pokemonTypeColor[type] ?? Colors.pink.shade300;
    } else {
      return Colors.pink.shade300;
    }
  }
}
