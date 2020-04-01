import 'package:mobx/mobx.dart';
import 'package:pokedex/app/models/pokemon.dart';
import 'package:pokedex/app/modules/home/repositories/home_repository.dart';
import 'package:pokedex/app/modules/home/repositories/home_status.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;

  _HomeControllerBase(this.repository);

  @observable
  List<Pokemon> pokemons;
  @observable
  HomeStatus status = HomeStatus.none;

  @action
  Future fetchPokemons() async {
    status = HomeStatus.loading;

    try {
      final response = await repository.fetchPokemons();
      pokemons = response;
      status = HomeStatus.success..value = response;
    } catch (e) {
      pokemons = null;
      print("Erro ao carregar a lista de pokemons: " + e.toString());
      status = HomeStatus.error..value = e;
    }
  }
}
