import 'package:pokedex/app/models/pokemon.dart';

abstract class IHomeRepository {
  Future<List<Pokemon>> getAllPokemons();
}
