class Pokemon {
  int id;
  String name;
  String imageUrl;

  Pokemon(this.id, this.name, this.imageUrl);

  factory Pokemon.fromJson(Map<String, dynamic> pokemon) =>
      Pokemon(_toInt(pokemon['url'].split("/").reversed.toList()[1]), pokemon['name'],
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon['url'].split("/").reversed.toList()[1]}.png');

  Map toJson() => {'id': id, 'name': name, 'imageUrl': imageUrl};
}

int _toInt(id) => id is int ? id : int.parse(id);