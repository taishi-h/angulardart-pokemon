import 'dart:async';
import 'dart:convert';

import 'package:angular/core.dart';
import 'package:http/http.dart';

import 'pokemon.dart';

@Injectable()
class PokemonService {
  static const _url = 'https://pokeapi.co/api/v2/pokemon/';

  final Client _http;
  PokemonService(this._http);
  Future<List<Pokemon>> getAll() async {
    try {
      final response = await _http.get(_url);
      print(_extractData(response));
      final pokemons = (_extractData(response) as List)
          .sublist(0, 151)
          .map((json) => Pokemon.fromJson(json))
          .toList();
      return pokemons;
    } catch (e) {
      throw _handleError(e);
    }
  }
  dynamic _extractData(Response resp) => json.decode(resp.body)['results'];
  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }
  Future<Pokemon> getById(int id) async {
    try {
      final response = await _http.get('$_url$id/');
      return Pokemon.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }
  Future<Pokemon> getByName(String name) async {
    try {
      final response = await _http.get('$_url$name/');
      return Pokemon.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }
}