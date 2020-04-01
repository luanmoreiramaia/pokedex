import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/models/pokemon.dart';
import 'package:pokedex/app/shared/const.dart';

class HomeRepository extends Disposable {
  final Dio _client;

  HomeRepository(this._client);

  Future<List<Pokemon>> fetchPokemons() async {
    final Response<dynamic> response =
        await _client.get(Consts.BASE_URL_POKEAPI);

    return (json.decode(response.data)["pokemon"] as List)
        .map((e) => Pokemon.fromJson(e))
        .toList();
  }

  @override
  void dispose() {}
}
