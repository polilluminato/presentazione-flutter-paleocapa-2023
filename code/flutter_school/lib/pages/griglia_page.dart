import 'package:flutter/material.dart';
import 'package:flutter_school/data/pokemon_list.dart';
import 'package:flutter_school/models/pokemon_item.dart';
import 'package:flutter_school/pages/single_pokemon_page.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          PokemonItem myPokemon = pokemonList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SinglePokemonPage(
                    pokemon: myPokemon,
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(myPokemon.imageLink ?? ""),
                  ),
                  Text(
                    myPokemon.name,
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
