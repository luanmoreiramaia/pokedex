import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/models/pokemon.dart';
import 'package:pokedex/app/pages/about_pokemon/about_pokemon_page.dart';
import 'package:pokedex/app/pages/pokemon_detail/pokemon_detail_controller.dart';
import 'package:pokedex/app/shared/components/scaffold_home.dart';
import 'package:pokedex/app/shared/const.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
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
  MultiTrackTween _animation;

  @override
  void initState() {
    super.initState();

    controller.pageController = PageController(
      initialPage: widget.index,
      viewportFraction: 0.39,
    );

    controller.changePokemon(list: widget.pokemons, index: widget.index);
    controller.getInfoPokemon(widget.pokemons[widget.index].name);
    controller.getInfoSpecie(widget.pokemons[widget.index].num);

    _animation = MultiTrackTween([
      Track("rotation").add(Duration(seconds: 5), Tween(begin: 0.0, end: 6.3),
          curve: Curves.linear)
    ]);
  }

  @override
  void dispose() {
    controller.pageController.dispose();
    super.dispose();
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0;

    return ((progress - lower) / (upper - lower)).clamp(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      allowFontScaling: false,
    );

    return ResponsiveWidgets.builder(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      allowFontScaling: false,
      child: Observer(
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
                tiposPokemon(),
                numeroPokemon(),
                pokeballBackground(),
                dadosPokemon(),
                pageViewPokemons(),
              ],
            ),
          );
        },
      ),
    );
  }

  pageViewPokemons() => Observer(
        builder: (_) {
          return Opacity(
            opacity: controller.opacity,
            child: Padding(
              padding: EdgeInsets.only(
                top: controller.opacity == 0
                    ? 1000
                    : 35 - controller.progress * 30,
              ),
              child: SizedBox(
                height: 170,
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: widget.pokemons.length,
                  onPageChanged: (index) {
                    controller.changePokemon(
                        list: widget.pokemons, index: index);
                    controller.getInfoPokemon(widget.pokemons[index].name);
                    controller.getInfoSpecie(widget.pokemons[index].num);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return imagemPokemon(index);
                  },
                ),
              ),
            ),
          );
        },
      );

  numeroPokemon() => Container(
        padding: EdgeInsets.only(
          top: 4,
          right: 32,
        ),
        child: Text(
          '#${controller.pokemon.num}',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Google',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        alignment: Alignment.topRight,
      );

  pokeballBackground() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final double sizePokeball = 170;

    return Positioned(
      left: screenWidth - (sizePokeball - 40),
      bottom: ((screenHeight - sizePokeball) / 1.7),
      child: Hero(
        tag: controller.pokemon.num,
        child: ControlledAnimation(
          playback: Playback.LOOP,
          duration: _animation.duration,
          tween: _animation,
          builder: (context, animation) {
            return Transform.rotate(
              angle: animation['rotation'],
              child: Opacity(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: controller.opacity == 0 ? 1000 : 0,
                  ),
                  child: Image.asset(
                    Consts.WHITE_POKEBALL,
                    height: sizePokeball,
                    width: sizePokeball,
                  ),
                ),
                opacity: 0.15,
              ),
            );
          },
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
                  controller.getInfoPokemon(widget.pokemons[widget.index].name);
                  controller.getInfoSpecie(widget.pokemons[widget.index].num);
                },
              )
            ],
          ),
        ),
      );

  dadosPokemon() => SlidingSheet(
        listener: (state) {
          controller.progress = state.progress;
          controller.multiple = 1 - interval(0.00, 0.65, controller.progress);
          controller.opacity = controller.multiple;
        },
        cornerRadius: 30,
        snapSpec: SnapSpec(
          snap: true,
          snappings: [0.65, 0.92],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height * 0.32),
            child: Observer(
              builder: (_) {
                if (controller.pokemonV2.error != null) {
                  return textWarning(
                      "Ocorreu um problema ao buscar os dados do pokemon: ${controller.pokemonV2.error.message}");
                } else if (controller.pokemonV2.value == null) {
                  return circularProgressPokemon();
                }

                if (controller.specie.error != null) {
                  return textWarning(
                      "Ocorreu um problema ao buscar os dados do pokemon: ${controller.specie.error.message}");
                } else if (controller.specie.value == null) {
                  return circularProgressPokemon();
                }

                return AboutPokemonPage(
                  pokemon: controller.pokemon,
                  pokemonV2: controller.pokemonV2.value,
                  specie: controller.specie.value,
                );
              },
            ),
          );
        },
      );

  circularProgressPokemon() => Padding(
        padding: EdgeInsets.only(
          bottom: 100,
        ),
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                  controller.pokemon.typeToColor(controller.pokemon.type[0]))),
        ),
      );

  tiposPokemon() {
    List<Widget> list;

    list = controller.pokemon.type.map((typeDesc) {
      return Padding(
        padding: EdgeInsets.only(right: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.fromLTRB(18, 8, 18, 8),
          child: Text(
            typeDesc,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: "Google",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }).toList();

    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
    );
  }

  imagemPokemon(int index) => IgnorePointer(
        child: Align(
          alignment: Alignment.topCenter,
          child: Observer(
            builder: (_) {
              return AnimatedPadding(
                child: CachedNetworkImage(
                  placeholder: (_, __) => Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  color: index == controller.posicaoAtual
                      ? null
                      : Colors.black.withOpacity(0.3),
                  height: 170 - controller.progress * 140,
                  width: 170 - controller.progress * 140,
                  imageUrl:
                      "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${widget.pokemons[index].num}.png",
                ),
                curve: Curves.bounceInOut,
                duration: Duration(milliseconds: 400),
                padding: EdgeInsetsResponsive.all(
                    index == controller.posicaoAtual ? 0 : 60),
              );
            },
          ),
        ),
      );
}
