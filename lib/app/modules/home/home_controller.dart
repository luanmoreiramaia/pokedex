import 'package:mobx/mobx.dart';
import 'package:pokedex/app/models/pokemon.dart';
import 'package:pokedex/app/modules/home/repositories/home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;

  _HomeControllerBase(this.repository);

  @observable
  ObservableFuture<List<Pokemon>> listPokemons;

  @action
  getAllPokemons() {
    listPokemons = repository.getAllPokemons().asObservable();
  }
}
