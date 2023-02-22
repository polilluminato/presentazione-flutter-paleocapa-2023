import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_5id/models/pokemon.dart';
import 'package:flutter_5id/models/pokemon_item.dart';
import 'package:http/http.dart' as http;

class SinglePokemonPage extends StatelessWidget {
  const SinglePokemonPage({super.key, required this.pokemon});

  final PokemonItem pokemon;

  Future<Pokemon> _loadInfoPokemon() async {
    try {
      final http.Response response = await http.get(Uri.parse(pokemon.link));
      Pokemon pokemonFromAPI = Pokemon.fromJson(json.decode(response.body));
      return pokemonFromAPI;
    } catch (err) {
      print(err);
    }
    return Pokemon(name: "Error", height: 0, weight: 0, imageLink: "");
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Single Pokémon"),
      ),
      body: FutureBuilder<Pokemon>(
        future: _loadInfoPokemon(),
        builder: (BuildContext ctx, AsyncSnapshot<Pokemon> snapshot) {
          if (snapshot.hasData) {
            Pokemon myPokemon = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(myPokemon.imageLink),
                  Text(
                    myPokemon.name,
                    style: textTheme.displayMedium,
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                "${myPokemon.weight}",
                                style: textTheme.headlineMedium,
                              ),
                              Text(
                                "Weight",
                                style: textTheme.bodyLarge,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                "${myPokemon.height}",
                                style: textTheme.headlineMedium,
                              ),
                              Text(
                                "Height",
                                style: textTheme.bodyLarge,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
