import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Pokemon {
  List abilities;
  int base_experience;
  List forms;
  List game_indices;
  int height;
  List held_items;
  int id;
  bool is_default;
  String location_area_encounters;
  List moves;
  String name;
  int order;
  List past_types;
  Map species;
  Map sprites;
  List stats;
  List types;
  int weight;

  Pokemon(
      {this.abilities,
      this.base_experience,
      this.forms,
      this.game_indices,
      this.height,
      this.held_items,
      this.id,
      this.is_default,
      this.location_area_encounters,
      this.moves,
      this.name,
      this.order,
      this.past_types,
      this.species,
      this.sprites,
      this.stats,
      this.types,
      this.weight});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        abilities: json['abilities'],
        base_experience: json['base_experience'],
        forms: json['forms'],
        game_indices: json['game_indices'],
        height: json['height'],
        held_items: json['held_items'],
        id: json['id'],
        is_default: json['is_default'],
        location_area_encounters: json['location_area_encounters'],
        moves: json['moves'],
        name: json['name'],
        order: json['order'],
        past_types: json['past_types'],
        species: json['species'],
        sprites: json['sprites'],
        stats: json['stats'],
        types: json['types'],
        weight: json['weight']);
  }
}

void main() async {
  Future<Pokemon> fetchPokemon() async {
    final response =
        await http.get(Uri.https('pokeapi.co', '/api/v2/pokemon/ditto'));

    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('FAiled to load Pokemon');
    }
  }

  var jsonData = await fetchPokemon();

  print(jsonData.moves);
}
