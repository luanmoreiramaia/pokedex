import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pokedex/app/models/pokemon.dart';
import 'package:pokedex/app/models/pokemon_v2.dart';
import 'package:pokedex/app/models/specie.dart';
import 'package:pokedex/app/pages/about_pokemon/about_pokemon_controller.dart';
import 'package:pokedex/app/pages/about_pokemon/components/tab_evolucao.dart';
import 'package:pokedex/app/pages/about_pokemon/components/tab_sobre.dart';
import 'package:pokedex/app/pages/about_pokemon/components/tab_status.dart';

class AboutPokemonPage extends StatefulWidget {
  final Pokemon pokemon;
  final PokemonV2 pokemonV2;
  final Specie specie;

  const AboutPokemonPage({
    Key key,
    @required this.pokemon,
    @required this.pokemonV2,
    @required this.specie,
  }) : super(key: key);

  @override
  _AboutPokemonPageState createState() => _AboutPokemonPageState();
}

class _AboutPokemonPageState
    extends ModularState<AboutPokemonPage, AboutPokemonController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );

    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Observer(builder: (_) {
            return TabBar(
              onTap: (index) {
                controller.changeIndexPage(index);
                _pageController.animateToPage(
                  index,
                  duration: Duration(
                    milliseconds: 300,
                  ),
                  curve: Curves.easeInOut,
                );
              },
              controller: _tabController,
              labelStyle: TextStyle(fontWeight: FontWeight.w700),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: pokemon.typeToColor(pokemon.type[0]),
              unselectedLabelColor: Color(0xff5f6368),
              isScrollable: true,
              indicator: MD2Indicator(
                  indicatorHeight: 3,
                  indicatorColor: pokemon.typeToColor(pokemon.type[0]),
                  indicatorSize: MD2IndicatorSize.normal),
              tabs: <Widget>[
                Tab(
                  text: "Sobre",
                ),
                Tab(
                  text: "Evolução",
                ),
                Tab(
                  text: "Status",
                ),
              ],
            );
          }),
        ),
      ),
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          controller.changeIndexPage(index);
          _tabController.animateTo(
            index,
            duration: Duration(
              milliseconds: 300,
            ),
          );
        },
        children: <Widget>[
          TabSobre(
            specie: widget.specie,
            pokemon: widget.pokemon,
          ),
          TabEvolucao(
            pokemon: widget.pokemon,
          ),
          TabStatus(
            pokemonV2: widget.pokemonV2,
          ),
        ],
      ),
    );
  }
}
