import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/models/pokemon.dart';
import 'package:pokedex/app/pages/pokemon_detail/pokemon_detail_controller.dart';
import 'package:pokedex/app/shared/components/scaffold_home.dart';
import 'package:pokedex/app/shared/const.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokemonDetailPage extends StatefulWidget {
  final int index;
  final List<Pokemon> pokemons;

  const PokemonDetailPage({Key key, this.index, this.pokemons})
      : super(key: key);

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState
    extends ModularState<PokemonDetailPage, PokemonDetailController> {
  @override
  void initState() {
    controller.pageController = PageController(
      initialPage: widget.index,
    );

    controller.changePokemon(list: widget.pokemons, index: widget.index);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return CustomScaffold(
          actionsAppBar: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
          backgroundColor:
              controller.pokemon.typeToColor(controller.pokemon.type[0]),
          titleAppBar: controller.pokemon.name,
          colorTitleAppBar: Colors.white,
          body: Stack(
            children: <Widget>[
              pokeballBackground(),
              dadosPokemon(),
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: widget.pokemons.length,
                    onPageChanged: (index) {
                      controller.changePokemon(
                          list: widget.pokemons, index: index);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return imagemPokemon(controller.pokemon.num);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  pokeballBackground() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final double sizePokeball = 170;

    return Positioned(
      left: screenWidth - (sizePokeball - 20),
      bottom: ((screenHeight - sizePokeball) / 1.8),
      child: Opacity(
        child: Image.asset(
          Consts.WHITE_POKEBALL,
          height: sizePokeball,
          width: sizePokeball,
        ),
        opacity: 0.15,
      ),
    );
  }

  dadosPokemon() => SlidingSheet(
        cornerRadius: 30,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.55, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height,
          );
        },
      );

  imagemPokemon(String numero) => Align(
        alignment: Alignment.topCenter,
        child: CachedNetworkImage(
          placeholder: (_, __) => Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: Colors.white,
            ),
          ),
          height: 200,
          width: 200,
          imageUrl:
              "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png",
        ),
      );
}
