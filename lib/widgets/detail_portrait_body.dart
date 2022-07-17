import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/core/button.dart';
import 'package:pokedex_app/model/pokemon_model.dart';
import 'package:pokedex_app/widgets/poke_information.dart';
import 'package:pokedex_app/widgets/poke_type_name.dart';

class DetailPortraitBody extends StatelessWidget {
  final PokemonModel pokemon;
  final String pokemonLogoPath = 'assets/images/pokeball.png';
  const DetailPortraitBody({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ButtonCoreWidget(),
          PokeNameType(
            pokemon: pokemon,
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: pokemonLogo(),
              ),
              Positioned(bottom: 0, right: 0, left: 0, top: 0.11.sh, child: PokeInformation(pokemon: pokemon)),
              Align(
                alignment: Alignment.topCenter,
                child: pokemonImage(),
              )
            ],
          )),
        ],
      )),
    );
  }

  Hero pokemonImage() {
    return Hero(
      tag: pokemon.id!,
      child: CachedNetworkImage(
        imageUrl: pokemon.img ?? '',
        height: 0.25.sh,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Image pokemonLogo() => Image.asset(pokemonLogoPath, height: 0.15.sh, fit: BoxFit.fitWidth);
}
