import 'color_pokemon.dart';

class FlavorTextEntries {
  String flavorText;
  ColorPokemon language;
  ColorPokemon version;

  FlavorTextEntries({this.flavorText, this.language, this.version});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language = json['language'] != null
        ? new ColorPokemon.fromJson(json['language'])
        : null;
    version = json['version'] != null
        ? new ColorPokemon.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flavor_text'] = this.flavorText;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    if (this.version != null) {
      data['version'] = this.version.toJson();
    }
    return data;
  }
}
