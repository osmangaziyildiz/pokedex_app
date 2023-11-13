import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_dex_app/pages/home_page.dart';
import 'package:poke_dex_app/services/pokedex_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PokedexApi.getPokemonData();
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true)
            .copyWith(textTheme: GoogleFonts.quicksandTextTheme()),
        home: const HomePage(),
      ),
    );
  }
}
