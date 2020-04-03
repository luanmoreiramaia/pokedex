import 'package:flutter/material.dart';

import 'next_evolution.dart';
import 'prev_evolution.dart';

class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  String egg;
  List<NextEvolution> nextEvolution;
  List<PrevEvolution> prevEvolution;

  Pokemon(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.egg,
      this.nextEvolution,
      this.prevEvolution});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    egg = json['egg'];

    if (json['next_evolution'] != null) {
      nextEvolution = new List<NextEvolution>();
      json['next_evolution'].forEach((v) {
        nextEvolution.add(new NextEvolution.fromJson(v));
      });
    }

    if (json['prev_evolution'] != null) {
      prevEvolution = new List<PrevEvolution>();
      json['prev_evolution'].forEach((v) {
        prevEvolution.add(new PrevEvolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.num;
    data['name'] = this.name;
    data['img'] = this.img;
    data['type'] = this.type;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['candy'] = this.candy;
    data['egg'] = this.egg;

    if (this.nextEvolution != null) {
      data['next_evolution'] =
          this.nextEvolution.map((v) => v.toJson()).toList();
    }

    if (this.prevEvolution != null) {
      data['prev_evolution'] =
          this.prevEvolution.map((v) => v.toJson()).toList();
    }

    return data;
  }

  Color typeToColor(String type) {
    switch (type) {
      case "Normal":
        return Colors.brown[400];
        break;
      case "Fire":
        return Colors.red;
        break;
      case "Water":
        return Colors.blue;
        break;
      case "Grass":
        return Colors.green;
        break;
      case "Eletric":
        return Colors.amber;
        break;
      case "Ice":
        return Colors.cyanAccent[400];
        break;
      case "Fighting":
        return Colors.orange;
        break;
      case "Poison":
        return Colors.purple;
        break;
      case "Ground":
        return Colors.orange[300];
        break;
      case "Flying":
        return Colors.indigo[200];
        break;
      case "Psychic":
        return Colors.pink;
        break;
      case "Bug":
        return Colors.lightGreen[500];
        break;
      case "Rock":
        return Colors.grey;
        break;
      case "Ghost":
        return Colors.indigo[400];
        break;
      case "Dark":
        return Colors.brown;
        break;
      case "Dragon":
        return Colors.indigo[800];
        break;
      case "Steel":
        return Colors.blueGrey;
        break;
      case "Fairy":
        return Colors.pinkAccent[100];
        break;
      default:
        return Colors.grey;
        break;
    }
  }
}
