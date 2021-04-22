import 'pokemon_api.dart';

void main() async {
  var jsonData = await fetchPokemon('ditto');

  print(jsonData.moves);
}
