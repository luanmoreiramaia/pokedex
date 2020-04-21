import 'package:flutter/material.dart';
import 'package:pokedex/app/models/pokemon.dart';
import 'package:pokedex/app/models/specie.dart';

class TabSobre extends StatelessWidget {
  final Specie specie;
  final Pokemon pokemon;

  const TabSobre({Key key, this.specie, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textSobre(
            text: "Descrição",
            isBold: true,
            fontSize: 16,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 100,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: textSobre(
                text: specie.flavorTextEntries
                    .where((item) => item.language.name == 'en')
                    .first
                    .flavorText,
                isBold: false,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          textSobre(
            text: "Biologia",
            isBold: true,
            fontSize: 16,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 220,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    textSobre(
                      text: "Altura",
                      isBold: true,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    textSobre(
                      text: pokemon.height,
                      isBold: false,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    textSobre(
                      text: "Peso",
                      isBold: true,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    textSobre(
                      text: pokemon.weight,
                      isBold: false,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  textSobre({String text, bool isBold, double fontSize, Color color}) => Text(
        text,
        style: TextStyle(
          fontFamily: 'Google',
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize,
          color: color,
        ),
      );
}
