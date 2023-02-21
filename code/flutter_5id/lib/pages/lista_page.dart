import 'package:flutter/material.dart';
import 'package:flutter_5id/data/pokemon_list.dart';
import 'package:flutter_5id/models/pokemon_item.dart';
import 'package:flutter_5id/pages/single_pokemon_page.dart';

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
            child: ListTile(
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
              subtitle: Text(myPokemon.link),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
