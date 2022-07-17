import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/model/pokemon_model.dart';
import 'package:pokedex_app/pages/detail_page.dart';
import 'package:pokedex_app/widgets/poke_img_and_ball.dart';

class PokemonItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(pokemon: pokemon)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CardBorderRadius().borderRadius)),
        elevation: 3,
        shadowColor: CardShadowColor().color,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pokemonItemName(context),
              pokemonItemType(context),
              Expanded(child: PokemonImageAndBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }

  Chip pokemonItemType(BuildContext context) {
    return Chip(
        label: Text(
      pokemon.type?[0] ?? 'N/A',
      style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
    ));
  }

  Text pokemonItemName(context) => Text(
        pokemon.name ?? 'N/A',
        style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      );
}

class CardBorderRadius {
  final double borderRadius = 15.w;
}

class CardShadowColor {
  final Color color = Colors.white;
}
