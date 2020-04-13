// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailController on _PokemonDetailControllerBase, Store {
  final _$pokemonAtom = Atom(name: '_PokemonDetailControllerBase.pokemon');

  @override
  Pokemon get pokemon {
    _$pokemonAtom.context.enforceReadPolicy(_$pokemonAtom);
    _$pokemonAtom.reportObserved();
    return super.pokemon;
  }

  @override
  set pokemon(Pokemon value) {
    _$pokemonAtom.context.conditionallyRunInAction(() {
      super.pokemon = value;
      _$pokemonAtom.reportChanged();
    }, _$pokemonAtom, name: '${_$pokemonAtom.name}_set');
  }

  final _$pageControllerAtom =
      Atom(name: '_PokemonDetailControllerBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.context.enforceReadPolicy(_$pageControllerAtom);
    _$pageControllerAtom.reportObserved();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.context.conditionallyRunInAction(() {
      super.pageController = value;
      _$pageControllerAtom.reportChanged();
    }, _$pageControllerAtom, name: '${_$pageControllerAtom.name}_set');
  }

  final _$_PokemonDetailControllerBaseActionController =
      ActionController(name: '_PokemonDetailControllerBase');

  @override
  dynamic changePokemon({List<Pokemon> list, int index}) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction();
    try {
      return super.changePokemon(list: list, index: index);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'pokemon: ${pokemon.toString()},pageController: ${pageController.toString()}';
    return '{$string}';
  }
}
