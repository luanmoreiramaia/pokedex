import 'egg_groups.dart';
import 'pal_park_encounters.dart';
import 'color_pokemon.dart';
import 'evolution_chain.dart';
import 'flavor_text_entries.dart';
import 'genera.dart';
import 'names.dart';
import 'pokedex_numbers.dart';
import 'varieties.dart';

class Specie {
  int baseHappiness;
  int captureRate;
  ColorPokemon color;
  List<EggGroups> eggGroups;
  EvolutionChain evolutionChain;
  ColorPokemon evolvesFromSpecies;
  List<FlavorTextEntries> flavorTextEntries;
  bool formsSwitchable;
  int genderRate;
  List<Genera> genera;
  ColorPokemon generation;
  ColorPokemon growthRate;
  ColorPokemon habitat;
  bool hasGenderDifferences;
  int hatchCounter;
  int id;
  bool isBaby;
  String name;
  List<Names> names;
  int order;
  List<PalParkEncounters> palParkEncounters;
  List<PokedexNumbers> pokedexNumbers;
  ColorPokemon shape;
  List<Varieties> varieties;

  Specie(
      {this.baseHappiness,
      this.captureRate,
      this.color,
      this.eggGroups,
      this.evolutionChain,
      this.evolvesFromSpecies,
      this.flavorTextEntries,
      this.formsSwitchable,
      this.genderRate,
      this.genera,
      this.generation,
      this.growthRate,
      this.habitat,
      this.hasGenderDifferences,
      this.hatchCounter,
      this.id,
      this.isBaby,
      this.name,
      this.names,
      this.order,
      this.palParkEncounters,
      this.pokedexNumbers,
      this.shape,
      this.varieties});

  Specie.fromJson(Map<String, dynamic> json) {
    baseHappiness = json['base_happiness'];
    captureRate = json['capture_rate'];
    color =
        json['color'] != null ? new ColorPokemon.fromJson(json['color']) : null;
    if (json['egg_groups'] != null) {
      eggGroups = new List<EggGroups>();
      json['egg_groups'].forEach((v) {
        eggGroups.add(new EggGroups.fromJson(v));
      });
    }
    evolutionChain = json['evolution_chain'] != null
        ? new EvolutionChain.fromJson(json['evolution_chain'])
        : null;
    evolvesFromSpecies = json['evolves_from_species'] != null
        ? new ColorPokemon.fromJson(json['evolves_from_species'])
        : null;
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = new List<FlavorTextEntries>();
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries.add(new FlavorTextEntries.fromJson(v));
      });
    }
    formsSwitchable = json['forms_switchable'];
    genderRate = json['gender_rate'];
    if (json['genera'] != null) {
      genera = new List<Genera>();
      json['genera'].forEach((v) {
        genera.add(new Genera.fromJson(v));
      });
    }
    generation = json['generation'] != null
        ? new ColorPokemon.fromJson(json['generation'])
        : null;
    growthRate = json['growth_rate'] != null
        ? new ColorPokemon.fromJson(json['growth_rate'])
        : null;
    habitat = json['habitat'] != null
        ? new ColorPokemon.fromJson(json['habitat'])
        : null;
    hasGenderDifferences = json['has_gender_differences'];
    hatchCounter = json['hatch_counter'];
    id = json['id'];
    isBaby = json['is_baby'];
    name = json['name'];
    if (json['names'] != null) {
      names = new List<Names>();
      json['names'].forEach((v) {
        names.add(new Names.fromJson(v));
      });
    }
    order = json['order'];
    if (json['pal_park_encounters'] != null) {
      palParkEncounters = new List<PalParkEncounters>();
      json['pal_park_encounters'].forEach((v) {
        palParkEncounters.add(new PalParkEncounters.fromJson(v));
      });
    }
    if (json['pokedex_numbers'] != null) {
      pokedexNumbers = new List<PokedexNumbers>();
      json['pokedex_numbers'].forEach((v) {
        pokedexNumbers.add(new PokedexNumbers.fromJson(v));
      });
    }
    shape =
        json['shape'] != null ? new ColorPokemon.fromJson(json['shape']) : null;
    if (json['varieties'] != null) {
      varieties = new List<Varieties>();
      json['varieties'].forEach((v) {
        varieties.add(new Varieties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_happiness'] = this.baseHappiness;
    data['capture_rate'] = this.captureRate;
    if (this.color != null) {
      data['color'] = this.color.toJson();
    }
    if (this.eggGroups != null) {
      data['egg_groups'] = this.eggGroups.map((v) => v.toJson()).toList();
    }
    if (this.evolutionChain != null) {
      data['evolution_chain'] = this.evolutionChain.toJson();
    }
    data['evolves_from_species'] = this.evolvesFromSpecies;
    if (this.flavorTextEntries != null) {
      data['flavor_text_entries'] =
          this.flavorTextEntries.map((v) => v.toJson()).toList();
    }
    data['forms_switchable'] = this.formsSwitchable;
    data['gender_rate'] = this.genderRate;
    if (this.genera != null) {
      data['genera'] = this.genera.map((v) => v.toJson()).toList();
    }
    if (this.generation != null) {
      data['generation'] = this.generation.toJson();
    }
    if (this.growthRate != null) {
      data['growth_rate'] = this.growthRate.toJson();
    }
    if (this.habitat != null) {
      data['habitat'] = this.habitat.toJson();
    }
    data['has_gender_differences'] = this.hasGenderDifferences;
    data['hatch_counter'] = this.hatchCounter;
    data['id'] = this.id;
    data['is_baby'] = this.isBaby;
    data['name'] = this.name;
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    data['order'] = this.order;
    if (this.palParkEncounters != null) {
      data['pal_park_encounters'] =
          this.palParkEncounters.map((v) => v.toJson()).toList();
    }
    if (this.pokedexNumbers != null) {
      data['pokedex_numbers'] =
          this.pokedexNumbers.map((v) => v.toJson()).toList();
    }
    if (this.shape != null) {
      data['shape'] = this.shape.toJson();
    }
    if (this.varieties != null) {
      data['varieties'] = this.varieties.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
