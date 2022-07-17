import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/model/pokemon_model.dart';
import 'package:pokedex_app/widgets/detail_landscape_body.dart';
import 'package:pokedex_app/widgets/detail_portrait_body.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? DetailPortraitBody(
            pokemon: pokemon,
          )
        : DetailLandScape(
            pokemon: pokemon,
          );
  }
}
