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

  @observable
  int posicaoAtual;

  @observable
  double progress = 0;

  @observable
  double multiple = 1;

  @observable
  double opacity = 1;

  @observable
  bool visibilityPageView = true;

  @action
  changePokemon({List<Pokemon> list, int index}) {
    pokemon = list[index];
    posicaoAtual = index;
  }
}
