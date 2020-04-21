import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/app/models/pokemon.dart';
import 'package:pokedex/app/models/pokemon_v2.dart';
import 'package:pokedex/app/models/specie.dart';
import 'package:pokedex/app/pages/about_pokemon/repositories/about_pokemon_repository_interface.dart';

part 'pokemon_detail_controller.g.dart';

class PokemonDetailController = _PokemonDetailControllerBase
    with _$PokemonDetailController;

abstract class _PokemonDetailControllerBase with Store {
  final IAboutPokemonRepository _repository;

  _PokemonDetailControllerBase(this._repository);

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

  @action
  changePokemon({List<Pokemon> list, int index}) {
    pokemon = list[index];
    posicaoAtual = index;
  }

  @observable
  ObservableFuture<Specie> specie;
  @observable
  ObservableFuture<PokemonV2> pokemonV2;

  @action
  getInfoPokemon(String name) {
    pokemonV2 = _repository.getInfoPokemon(name).asObservable();
  }

  @action
  getInfoSpecie(String num) {
    specie = _repository.getInfoSpecie(num).asObservable();
  }
}
