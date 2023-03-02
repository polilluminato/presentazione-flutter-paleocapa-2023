import 'package:flutter/material.dart';
import 'package:flutter_school/data/pokemon_list.dart';
import 'package:flutter_school/models/pokemon_item.dart';
import 'package:flutter_school/pages/single_pokemon_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          PokemonItem myPokemon = pokemonList[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
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
              leading: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(myPokemon.imageLink ?? ""),
              ),
              title: Text(myPokemon.name),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
