import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/models/pokemon_v2.dart';
import 'package:pokedex/app/models/specie.dart';
import 'package:pokedex/app/shared/const.dart';
import 'about_pokemon_repository_interface.dart';

class AboutPokemonRepository extends Disposable
    implements IAboutPokemonRepository {
  final Dio _client;

  AboutPokemonRepository(this._client);

  @override
  void dispose() {}

  @override
  Future<PokemonV2> getInfoPokemon(String nome) async {
    final Response<dynamic> response =
        await _client.get(Consts.BASE_URL_POKEMON_V2 + nome.toLowerCase());

    return PokemonV2.fromJson(response.data);
  }

  @override
  Future<Specie> getInfoSpecie(String numero) async {
    final Response<dynamic> response = await _client
        .get(Consts.BASE_URL_SPECIE_V2 + int.parse(numero).toString());

    return Specie.fromJson(response.data);
  }
}
