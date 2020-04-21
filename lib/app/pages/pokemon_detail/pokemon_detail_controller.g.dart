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

  final _$posicaoAtualAtom =
      Atom(name: '_PokemonDetailControllerBase.posicaoAtual');

  @override
  int get posicaoAtual {
    _$posicaoAtualAtom.context.enforceReadPolicy(_$posicaoAtualAtom);
    _$posicaoAtualAtom.reportObserved();
    return super.posicaoAtual;
  }

  @override
  set posicaoAtual(int value) {
    _$posicaoAtualAtom.context.conditionallyRunInAction(() {
      super.posicaoAtual = value;
      _$posicaoAtualAtom.reportChanged();
    }, _$posicaoAtualAtom, name: '${_$posicaoAtualAtom.name}_set');
  }

  final _$progressAtom = Atom(name: '_PokemonDetailControllerBase.progress');

  @override
  double get progress {
    _$progressAtom.context.enforceReadPolicy(_$progressAtom);
    _$progressAtom.reportObserved();
    return super.progress;
  }

  @override
  set progress(double value) {
    _$progressAtom.context.conditionallyRunInAction(() {
      super.progress = value;
      _$progressAtom.reportChanged();
    }, _$progressAtom, name: '${_$progressAtom.name}_set');
  }

  final _$multipleAtom = Atom(name: '_PokemonDetailControllerBase.multiple');

  @override
  double get multiple {
    _$multipleAtom.context.enforceReadPolicy(_$multipleAtom);
    _$multipleAtom.reportObserved();
    return super.multiple;
  }

  @override
  set multiple(double value) {
    _$multipleAtom.context.conditionallyRunInAction(() {
      super.multiple = value;
      _$multipleAtom.reportChanged();
    }, _$multipleAtom, name: '${_$multipleAtom.name}_set');
  }

  final _$opacityAtom = Atom(name: '_PokemonDetailControllerBase.opacity');

  @override
  double get opacity {
    _$opacityAtom.context.enforceReadPolicy(_$opacityAtom);
    _$opacityAtom.reportObserved();
    return super.opacity;
  }

  @override
  set opacity(double value) {
    _$opacityAtom.context.conditionallyRunInAction(() {
      super.opacity = value;
      _$opacityAtom.reportChanged();
    }, _$opacityAtom, name: '${_$opacityAtom.name}_set');
  }

  final _$specieAtom = Atom(name: '_PokemonDetailControllerBase.specie');

  @override
  ObservableFuture<Specie> get specie {
    _$specieAtom.context.enforceReadPolicy(_$specieAtom);
    _$specieAtom.reportObserved();
    return super.specie;
  }

  @override
  set specie(ObservableFuture<Specie> value) {
    _$specieAtom.context.conditionallyRunInAction(() {
      super.specie = value;
      _$specieAtom.reportChanged();
    }, _$specieAtom, name: '${_$specieAtom.name}_set');
  }

  final _$pokemonV2Atom = Atom(name: '_PokemonDetailControllerBase.pokemonV2');

  @override
  ObservableFuture<PokemonV2> get pokemonV2 {
    _$pokemonV2Atom.context.enforceReadPolicy(_$pokemonV2Atom);
    _$pokemonV2Atom.reportObserved();
    return super.pokemonV2;
  }

  @override
  set pokemonV2(ObservableFuture<PokemonV2> value) {
    _$pokemonV2Atom.context.conditionallyRunInAction(() {
      super.pokemonV2 = value;
      _$pokemonV2Atom.reportChanged();
    }, _$pokemonV2Atom, name: '${_$pokemonV2Atom.name}_set');
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
  dynamic getInfoPokemon(String name) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction();
    try {
      return super.getInfoPokemon(name);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getInfoSpecie(String num) {
    final _$actionInfo =
        _$_PokemonDetailControllerBaseActionController.startAction();
    try {
      return super.getInfoSpecie(num);
    } finally {
      _$_PokemonDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'pokemon: ${pokemon.toString()},pageController: ${pageController.toString()},posicaoAtual: ${posicaoAtual.toString()},progress: ${progress.toString()},multiple: ${multiple.toString()},opacity: ${opacity.toString()},specie: ${specie.toString()},pokemonV2: ${pokemonV2.toString()}';
    return '{$string}';
  }
}
