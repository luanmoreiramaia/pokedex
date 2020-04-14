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

  final _$visibilityPageViewAtom =
      Atom(name: '_PokemonDetailControllerBase.visibilityPageView');

  @override
  bool get visibilityPageView {
    _$visibilityPageViewAtom.context
        .enforceReadPolicy(_$visibilityPageViewAtom);
    _$visibilityPageViewAtom.reportObserved();
    return super.visibilityPageView;
  }

  @override
  set visibilityPageView(bool value) {
    _$visibilityPageViewAtom.context.conditionallyRunInAction(() {
      super.visibilityPageView = value;
      _$visibilityPageViewAtom.reportChanged();
    }, _$visibilityPageViewAtom, name: '${_$visibilityPageViewAtom.name}_set');
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
        'pokemon: ${pokemon.toString()},pageController: ${pageController.toString()},posicaoAtual: ${posicaoAtual.toString()},progress: ${progress.toString()},multiple: ${multiple.toString()},opacity: ${opacity.toString()},visibilityPageView: ${visibilityPageView.toString()}';
    return '{$string}';
  }
}
