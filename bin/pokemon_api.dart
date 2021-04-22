import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'pokemon_class.dart';

Future<Pokemon> fetchPokemon(name) async {
  final response =
      await http.get(Uri.https('pokeapi.co', '/api/v2/pokemon/$name'));

  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Pokemon');
  }
}
