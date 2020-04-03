import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/app/modules/home/components/poke_item.dart';
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
    controller.getAllPokemons();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double itemHeight = (size.height) / 4;
    final double itemWidth = size.width / 2;

    return Container(
      color: Colors.white,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          imagePokeball(),
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
                if (controller.listPokemons.error != null) {
                  return textWarning(
                      "Ocorreu um problema ao buscar os pokemons: ${controller.listPokemons.error.message}");
                } else if (controller.listPokemons.value == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final list = controller.listPokemons.value;

                if (list.isNotEmpty) {
                  return AnimationLimiter(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(12),
                      addAutomaticKeepAlives: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (itemWidth / itemHeight),
                        crossAxisCount: 2,
                      ),
                      itemCount: list.length,
                      itemBuilder: (_, index) {
                        final pokemon = list[index];

                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: Duration(milliseconds: 375),
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: GestureDetector(
                              child: PokeItem(
                                nome: pokemon.name,
                                num: pokemon.num,
                                color: pokemon.typeToColor(pokemon.type[0]),
                                types: pokemon.type,
                              ),
                              onTap: () {
                                Modular.to.pushNamed("/pokemonDetail/$index",
                                    arguments: list);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else
                  return textWarning("Nenhum pokemon encontrado!");
              },
            ),
          ),
        ],
      ),
    );
  }

  imagePokeball() {
    double screenWidth = MediaQuery.of(context).size.width;
    double notificationBarHeight = MediaQuery.of(context).padding.top;

    return Positioned(
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
    );
  }

  textWarning(String text) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                child: Text("Tentar novamente?"),
                onPressed: () {
                  controller.getAllPokemons();
                },
              )
            ],
          ),
        ),
      );
}
