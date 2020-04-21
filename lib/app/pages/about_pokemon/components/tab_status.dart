import 'package:flutter/material.dart';
import 'package:pokedex/app/models/pokemon_v2.dart';
import 'package:pokedex/app/pages/about_pokemon/components/status_bar.dart';

class TabStatus extends StatelessWidget {
  final PokemonV2 pokemonV2;

  const TabStatus({Key key, this.pokemonV2}) : super(key: key);

  List<int> getStatusPokemon() {
    List<int> list = [0, 0, 0, 0, 0, 0, 0];
    int sum = 0;

    pokemonV2.stats.forEach((item) {
      sum += item.baseStat;

      switch (item.stat.name) {
        case 'speed':
          list[0] = item.baseStat;
          break;
        case 'special-defense':
          list[1] = item.baseStat;
          break;
        case 'special-attack':
          list[2] = item.baseStat;
          break;
        case 'defense':
          list[3] = item.baseStat;
          break;
        case 'attack':
          list[4] = item.baseStat;
          break;
        case 'hp':
          list[5] = item.baseStat;
          break;
      }
    });

    list[6] = sum;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              textStatus(
                color: Colors.black54,
                fontSize: 16,
                isBold: false,
                text: "Velocidade",
              ),
              SizedBox(
                height: 10,
              ),
              textStatus(
                color: Colors.black54,
                fontSize: 16,
                isBold: false,
                text: "Sp. Defesa",
              ),
              SizedBox(
                height: 10,
              ),
              textStatus(
                color: Colors.black54,
                fontSize: 16,
                isBold: false,
                text: "Sp. Ataque",
              ),
              SizedBox(
                height: 10,
              ),
              textStatus(
                color: Colors.black54,
                fontSize: 16,
                isBold: false,
                text: "Defesa",
              ),
              SizedBox(
                height: 10,
              ),
              textStatus(
                color: Colors.black54,
                fontSize: 16,
                isBold: false,
                text: "Ataque",
              ),
              SizedBox(
                height: 10,
              ),
              textStatus(
                color: Colors.black54,
                fontSize: 16,
                isBold: false,
                text: "HP",
              ),
              SizedBox(
                height: 10,
              ),
              textStatus(
                color: Colors.black54,
                fontSize: 16,
                isBold: false,
                text: "Total",
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Builder(builder: (_) {
            List<int> _list = getStatusPokemon();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                textStatus(
                  color: Colors.black,
                  fontSize: 16,
                  isBold: true,
                  text: _list[0].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                textStatus(
                  color: Colors.black,
                  fontSize: 16,
                  isBold: true,
                  text: _list[1].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                textStatus(
                  color: Colors.black,
                  fontSize: 16,
                  isBold: true,
                  text: _list[2].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                textStatus(
                  color: Colors.black,
                  fontSize: 16,
                  isBold: true,
                  text: _list[3].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                textStatus(
                  color: Colors.black,
                  fontSize: 16,
                  isBold: true,
                  text: _list[4].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                textStatus(
                  color: Colors.black,
                  fontSize: 16,
                  isBold: true,
                  text: _list[5].toString(),
                ),
                SizedBox(
                  height: 10,
                ),
                textStatus(
                  color: Colors.black,
                  fontSize: 16,
                  isBold: true,
                  text: _list[6].toString(),
                ),
              ],
            );
          }),
          SizedBox(
            width: 10,
          ),
          Builder(
            builder: (_) {
              List<int> _list = getStatusPokemon();

              return Expanded(
                child: Column(
                  children: <Widget>[
                    StatusBar(
                      widthFactor: _list[0] / 160,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    StatusBar(
                      widthFactor: _list[1] / 160,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    StatusBar(
                      widthFactor: _list[2] / 160,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    StatusBar(
                      widthFactor: _list[3] / 160,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    StatusBar(
                      widthFactor: _list[4] / 160,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    StatusBar(
                      widthFactor: _list[5] / 160,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    StatusBar(
                      widthFactor: _list[6] / 960,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  textStatus({String text, bool isBold, double fontSize, Color color}) => Text(
        text,
        style: TextStyle(
          fontFamily: 'Google',
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize,
          color: color,
        ),
      );
}
