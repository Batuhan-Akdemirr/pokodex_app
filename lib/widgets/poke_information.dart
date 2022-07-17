import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(ContainerBorderRadius().borderRadius)),
          color: ContainerColor().color),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformation(InformationText().name, pokemon.name, context),
            _buildInformation(InformationText().height, pokemon.height, context),
            _buildInformation(InformationText().weight, pokemon.weight, context),
            _buildInformation(InformationText().spawnTime, pokemon.spawnTime, context),
            _buildInformation(InformationText().weakness, pokemon.weaknesses, context),
            _buildInformation(InformationText().preEvulation, pokemon.prevEvolution, context),
            _buildInformation(InformationText().nextEvulation, pokemon.nextEvolution, context),
          ],
        ),
      ),
    );
  }

  Row _buildInformation(String label, dynamic value, BuildContext context) {
    const String error = 'Not Available';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        if (value is List && value.isNotEmpty)
          Text(value.join(' , '))
        else if (value == null)
          const Text(error)
        else
          Text(value.toString()),
      ],
    );
  }
}

class ContainerBorderRadius {
  final double borderRadius = 10.w;
}

class ContainerColor {
  final Color color = Colors.white;
}

class InformationText {
  final String name = 'Name';
  final String height = 'Height';
  final String weight = 'Weight';
  final String spawnTime = 'Spawn Time';
  final String weakness = 'Weakness';
  final String preEvulation = 'Pre Evulation';
  final String nextEvulation = 'Next Evulation ';
}
