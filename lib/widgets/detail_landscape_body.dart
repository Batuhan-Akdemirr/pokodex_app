import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/core/button.dart';
import 'package:pokedex_app/model/pokemon_model.dart';
import 'package:pokedex_app/widgets/poke_information.dart';

import 'poke_type_name.dart';

class DetailLandScape extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailLandScape({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ButtonCoreWidget(),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PokeNameType(pokemon: pokemon),
                      Expanded(
                        child: pokemonImage(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: UIHelper.getDefaultPadding(),
                      child: PokeInformation(pokemon: pokemon),
                    )),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Hero pokemonImage() {
    return Hero(
      tag: pokemon.id!,
      child: CachedNetworkImage(
        imageUrl: pokemon.img ?? '',
        height: 0.25.sw,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
