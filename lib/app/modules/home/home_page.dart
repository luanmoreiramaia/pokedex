import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/repositories/home_status.dart';
import 'package:pokedex/app/shared/components/scaffold_home.dart';
import 'package:pokedex/app/shared/const.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double notificationBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      color: Colors.white,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 4.3) + notificationBarHeight,
            left: screenWidth - (240 / 1.45),
            height: 240,
            width: 240,
            child: Opacity(
              opacity: .05,
              child: Image.asset(
                Consts.BLACK_POKEBALL,
              ),
            ),
          ),
          CustomScaffold(
            actionsAppBar: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.format_list_bulleted,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ],
            titleAppBar: "Pokedex",
            body: Observer(
              builder: (_) {
                if (controller.status == HomeStatus.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.status == HomeStatus.success) {
                  final list = controller.pokemons;

                  if (list.isNotEmpty) {
                    return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            title: Text(list[index].name),
                          );
                        });
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text("Nenhum pokemon encontrado!"),
                      ),
                    );
                  }
                } else if (controller.status == HomeStatus.error) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                          "Ocorreu um problema ao buscar os pokemons: ${controller.status.value}"),
                    ),
                  );
                } else {
                  Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
