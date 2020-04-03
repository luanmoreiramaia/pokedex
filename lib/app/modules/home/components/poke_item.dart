import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/shared/const.dart';

class PokeItem extends StatelessWidget {
  final int index;
  final String nome;
  final Color color;
  final String num;
  final List<String> types;

  const PokeItem(
      {Key key, this.index, this.nome, this.color, this.num, this.types})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: <Widget>[
            pokeballBackground(),
            fotoPokemon(),
            Padding(
              padding: EdgeInsets.only(
                left: 17,
                top: 22,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  nomePokemon(),
                  tiposPokemon(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  pokeballBackground() => Positioned(
        bottom: -(95 / 8),
        right: -(95 / 20),
        child: Opacity(
          child: Image.asset(
            Consts.WHITE_POKEBALL,
            height: 95,
            width: 95,
          ),
          opacity: 0.15,
        ),
      );

  fotoPokemon() => Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            placeholder: (_, __) => Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 15, right: 24),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            alignment: Alignment.bottomRight,
            height: 75,
            width: 75,
            imageUrl:
                "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png",
          ),
        ),
      );

  nomePokemon() => Text(
        nome,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontFamily: "Google",
          fontWeight: FontWeight.bold,
        ),
      );

  tiposPokemon() {
    List<Widget> list;

    list = types.map((typeDesc) {
      return Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
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
      padding: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
    );
  }
}
