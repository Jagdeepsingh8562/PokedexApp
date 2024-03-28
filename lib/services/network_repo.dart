import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/Pokemon.dart';

class PokeRepo {
  Future<PokeHub> fetchDataForHomeScreen() async {
    var url =
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
    var res = await http.get(Uri.parse(url));
    var decodedValue = jsonDecode(res.body);
    return PokeHub.fromJson(decodedValue);
  }

  Future<Pokemon> fetchDataForDetailScreen(String pokemonName) async {
    var url = 'https://pokeapi.co/api/v2/pokemon/$pokemonName';
    var res = await http.get(Uri.parse(url));
    var decodedValue = jsonDecode(res.body);
    return Pokemon.fromLocalJson(decodedValue);
  }
}
