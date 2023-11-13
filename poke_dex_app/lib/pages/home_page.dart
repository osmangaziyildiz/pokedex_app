import 'package:flutter/material.dart';
import 'package:poke_dex_app/widgets/app_bar_title.dart';
import 'package:poke_dex_app/widgets/pokemon_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppBarTitle(),
          Expanded(child: PokemonList()),
        ],
      ),
    );
  }
}
