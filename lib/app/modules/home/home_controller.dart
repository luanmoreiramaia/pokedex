import 'package:mobx/mobx.dart';
import 'package:pokedex/app/models/pokemon.dart';

import 'repositories/home_repository_interface.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IHomeRepository repository;

  _HomeControllerBase(this.repository);

  @observable
  ObservableFuture<List<Pokemon>> listPokemons;

  @action
  getAllPokemons() {
    listPokemons = repository.getAllPokemons().asObservable();
  }
}
