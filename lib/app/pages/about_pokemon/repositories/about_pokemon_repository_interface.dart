import 'package:pokedex/app/models/pokemon_v2.dart';
import 'package:pokedex/app/models/specie.dart';

abstract class IAboutPokemonRepository {
  Future<PokemonV2> getInfoPokemon(String nome);
  Future<Specie> getInfoSpecie(String numero);
}
