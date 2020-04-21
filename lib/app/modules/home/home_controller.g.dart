// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listPokemonsAtom = Atom(name: '_HomeControllerBase.listPokemons');

  @override
  ObservableFuture<List<Pokemon>> get listPokemons {
    _$listPokemonsAtom.context.enforceReadPolicy(_$listPokemonsAtom);
    _$listPokemonsAtom.reportObserved();
    return super.listPokemons;
  }

  @override
  set listPokemons(ObservableFuture<List<Pokemon>> value) {
    _$listPokemonsAtom.context.conditionallyRunInAction(() {
      super.listPokemons = value;
      _$listPokemonsAtom.reportChanged();
    }, _$listPokemonsAtom, name: '${_$listPokemonsAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic getAllPokemons() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.getAllPokemons();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'listPokemons: ${listPokemons.toString()}';
    return '{$string}';
  }
}
