import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/models/pokemon.dart';
import 'package:pokedex/app/modules/home/repositories/home_repository_interface.dart';
import 'package:pokedex/app/shared/const.dart';

class HomeRepository extends Disposable implements IHomeRepository {
  final Dio _client;

  HomeRepository(this._client);

  @override
  void dispose() {}

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    final Response<dynamic> response =
        await _client.get(Consts.BASE_URL_POKEAPI);

    return (json.decode(response.data)["pokemon"] as List)
        .map((e) => Pokemon.fromJson(e))
        .toList();
  }
}
