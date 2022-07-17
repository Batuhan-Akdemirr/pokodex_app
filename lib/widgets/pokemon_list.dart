import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/model/pokemon_model.dart';
import 'package:pokedex_app/service/pokodex_api.dart';
import 'package:pokedex_app/widgets/poke_list_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late final Future<List<PokemonModel>>? _pokemonList;

  @override
  void initState() {
    super.initState();
    _pokemonList = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
        future: _pokemonList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> myList = snapshot.data!;
            return gridview(myList);
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  GridView gridview(List<PokemonModel> myList) {
    return GridView.builder(
            itemCount:  myList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
              itemBuilder: (context, index) {
                var currentPokemonItem = myList[index];
                return PokemonItem(
                  pokemon: currentPokemonItem,
                );
              });
  }

  TextStyle listViewTextStyle() {
    return TextStyle(color: ListViewTextColor().color);
  }
}

class ListViewTextColor {
  final Color color = Colors.white;
}


