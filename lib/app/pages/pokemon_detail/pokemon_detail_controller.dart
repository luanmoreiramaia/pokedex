import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/app/models/pokemon.dart';

part 'pokemon_detail_controller.g.dart';

class PokemonDetailController = _PokemonDetailControllerBase
    with _$PokemonDetailController;

abstract class _PokemonDetailControllerBase with Store {
  @observable
  Pokemon pokemon;

  @observable
  PageController pageController;

  @action
  changePokemon({List<Pokemon> list, int index}) {
    pokemon = list[index];
  }
}
