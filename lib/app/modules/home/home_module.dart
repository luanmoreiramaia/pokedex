import 'package:dio/dio.dart';
import 'package:pokedex/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/home_page.dart';
import 'package:pokedex/app/modules/home/repositories/home_repository.dart';

import 'repositories/home_repository_interface.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IHomeRepository>((i) => HomeRepository(i.get<Dio>())),
        Bind((i) => HomeController(i.get<IHomeRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
