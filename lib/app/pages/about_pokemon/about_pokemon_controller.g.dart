// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_pokemon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AboutPokemonController on _AboutPokemonControllerBase, Store {
  final _$indexPageAtom = Atom(name: '_AboutPokemonControllerBase.indexPage');

  @override
  int get indexPage {
    _$indexPageAtom.context.enforceReadPolicy(_$indexPageAtom);
    _$indexPageAtom.reportObserved();
    return super.indexPage;
  }

  @override
  set indexPage(int value) {
    _$indexPageAtom.context.conditionallyRunInAction(() {
      super.indexPage = value;
      _$indexPageAtom.reportChanged();
    }, _$indexPageAtom, name: '${_$indexPageAtom.name}_set');
  }

  final _$_AboutPokemonControllerBaseActionController =
      ActionController(name: '_AboutPokemonControllerBase');

  @override
  dynamic changeIndexPage(int value) {
    final _$actionInfo =
        _$_AboutPokemonControllerBaseActionController.startAction();
    try {
      return super.changeIndexPage(value);
    } finally {
      _$_AboutPokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'indexPage: ${indexPage.toString()}';
    return '{$string}';
  }
}
