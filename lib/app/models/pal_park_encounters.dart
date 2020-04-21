import 'color_pokemon.dart';

class PalParkEncounters {
  ColorPokemon area;
  int baseScore;
  int rate;

  PalParkEncounters({this.area, this.baseScore, this.rate});

  PalParkEncounters.fromJson(Map<String, dynamic> json) {
    area =
        json['area'] != null ? new ColorPokemon.fromJson(json['area']) : null;
    baseScore = json['base_score'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.area != null) {
      data['area'] = this.area.toJson();
    }
    data['base_score'] = this.baseScore;
    data['rate'] = this.rate;
    return data;
  }
}
