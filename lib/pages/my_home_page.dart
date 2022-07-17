import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/app_title.dart';
import 'package:pokedex_app/widgets/pokemon_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(
      builder: (context, orientationn) {
        return Column(
          children: const [
            AppTitle(),
            Expanded(child: PokemonList()),
          ],
        );
      },
    ));
  }
}
