import 'package:pokedex/app/pages/pokemon_detail/pokemon_detail_controller.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/app_widget.dart';
import 'package:pokedex/app/modules/home/home_module.dart';
import 'package:pokedex/app/pages/pokemon_detail/pokemon_detail_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PokemonDetailController()),
        Bind((i) => AppController()),
        Bind((i) => Dio()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router("/pokemonDetail/:index",
            child: (_, args) => PokemonDetailPage(
                  index: int.parse(args.params['index']),
                  pokemons: args.data,
                )),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
