import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/models/pokemon.dart';

class TabEvolucao extends StatelessWidget {
  final Pokemon pokemon;

  const TabEvolucao({Key key, this.pokemon}) : super(key: key);

  List<Widget> getEvolucao() {
    List<Widget> list = [];

    if (pokemon.prevEvolution != null) {
      pokemon.prevEvolution.forEach((item) {
        list.add(imagemPokemon(item.num));
        list.add(textEvolucao(
          text: item.name,
          isBold: true,
          fontSize: 16,
        ));
        list.add(Icon(
          Icons.keyboard_arrow_down,
        ));
      });
    }

    list.add(imagemPokemon(pokemon.num));
    list.add(textEvolucao(
      text: pokemon.name,
      isBold: true,
      fontSize: 16,
    ));

    if (pokemon.nextEvolution != null) {
      pokemon.nextEvolution.forEach((item) {
        list.add(Icon(
          Icons.keyboard_arrow_down,
        ));
        list.add(imagemPokemon(item.num));
        list.add(textEvolucao(
          text: item.name,
          isBold: true,
          fontSize: 16,
        ));
      });
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: getEvolucao(),
        ),
      ),
    );
  }

  imagemPokemon(String num) => CachedNetworkImage(
        placeholder: (_, __) => Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.white,
          ),
        ),
        height: 80,
        width: 80,
        imageUrl:
            "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png",
      );

  textEvolucao({String text, bool isBold, double fontSize, Color color}) =>
      Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Google',
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: fontSize,
            color: color,
          ),
        ),
      );
}
