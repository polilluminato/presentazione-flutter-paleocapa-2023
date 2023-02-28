class PokemonItem {
  String name;
  String link;
  int? id;
  String? imageLink;

  PokemonItem(this.name, this.link) {
    //Link fatto come https://pokeapi.co/api/v2/pokemon/5/
    //  vado a prenderne id alla fine
    id = int.parse(link.substring(link.length - 2, link.length - 1));

    //I nomi mi arrivano tutti in lowercase, in questo modo metto la prima
    //  lettera maiuscola: bulbasaur -> Bulbasaur
    name = name[0].toUpperCase() + name.substring(1).toLowerCase();

    //Basandosi sull'API per il singolo pokemon l'immagine può essere ottenuta
    //  componendo il link in questo modo:
    //  - https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/{id}.png
    imageLink =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
  }
}
