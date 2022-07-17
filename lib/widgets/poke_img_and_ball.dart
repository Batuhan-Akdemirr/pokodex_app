import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/model/pokemon_model.dart';

class PokemonImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  final  String pokemonLogoPath = 'assets/images/pokeball.png';
  const PokemonImageAndBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: pokemonLogo(),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: pokemonImage()),
        )
      ],
    );
  }

  CachedNetworkImage pokemonImage() {
    return CachedNetworkImage(
          imageUrl: pokemon.img ?? '',
          width: UIHelper.calculatePokemonImageAndBallSize(),
          height: UIHelper.calculatePokemonImageAndBallSize(),
          fit: BoxFit.fitHeight,
          placeholder: (context, url) => CircularProgressIndicator(
            color: CircularProgressIndicatorColor().color,
          ),
        );
  }

  Image pokemonLogo() {
    return Image.asset(
          pokemonLogoPath,
          width: UIHelper.calculatePokemonImageAndBallSize(),
          height: UIHelper.calculatePokemonImageAndBallSize(),
          fit: BoxFit.fitHeight,
        );
  }
}

class CircularProgressIndicatorColor {
  final Color color = Colors.black;
}
