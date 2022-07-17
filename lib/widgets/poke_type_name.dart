import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/model/pokemon_model.dart';

class PokeNameType extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeNameType({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PokemonNameTypePadding().padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Expanded(child: pokemonName(context)), pokemonID(context)],
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          pokemonType(context),
        ],
      ),
    );
  }

  Chip pokemonType(BuildContext context) {
    return Chip(
        label: Text(
      pokemon.type?.join(' , ') ?? ' ',
      style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
    ));
  }

  Text pokemonID(BuildContext context) {
    return Text(
      ' #${pokemon.num}',
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Text pokemonName(BuildContext context) {
    return Text(
      pokemon.name ?? '',
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

class PokemonNameTypePadding {
  final EdgeInsets padding = EdgeInsets.symmetric(horizontal: 0.05.sh);
}
