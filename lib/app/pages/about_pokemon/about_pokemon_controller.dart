import 'package:mobx/mobx.dart';

part 'about_pokemon_controller.g.dart';

class AboutPokemonController = _AboutPokemonControllerBase
    with _$AboutPokemonController;

abstract class _AboutPokemonControllerBase with Store {
  @observable
  int indexPage;
  @action
  changeIndexPage(int value) => indexPage = value;
}
