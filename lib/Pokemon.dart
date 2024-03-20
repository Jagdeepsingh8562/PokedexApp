class PokeHub {
  List<Pokemon?> pokemon;

  PokeHub({required this.pokemon});

  factory PokeHub.fromJson(Map<String, dynamic> json) {
    return PokeHub(
      pokemon:
          List<Pokemon?>.from(json['pokemon'].map((x) => Pokemon.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pokemon'] = this.pokemon.map((v) => v?.toJson()).toList();
    return data;
  }
}

class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  double spawnChance;
  double avgSpawns;
  String spawnTime;
  List<double>? multipliers;
  List<String> weaknesses;
  List<NextEvolution>? nextEvolution;

  Pokemon(
      {required this.id,
      required this.num,
      required this.name,
      required this.img,
      required this.type,
      required this.height,
      required this.weight,
      required this.candy,
      required this.candyCount,
      required this.egg,
      required this.spawnChance,
      required this.avgSpawns,
      required this.spawnTime,
      this.multipliers,
      required this.weaknesses,
      this.nextEvolution});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img: json['img'],
      type: List<String>.from(json['type']),
      height: json['height'],
      weight: json['weight'],
      candy: json['candy'],
      candyCount: json['candy_count'] ?? 0,
      egg: json['egg'],
      spawnChance: double.parse(json['spawn_chance'].toString()),
      avgSpawns: double.parse(json['avg_spawns'].toString()),
      spawnTime: json['spawn_time'],
      multipliers: json['multipliers'] == null
          ? null
          : List<double>.from(json['multipliers']),
      weaknesses: List<String>.from(json['weaknesses']),
      nextEvolution: json['next_evolution'] != null
          ? List<NextEvolution>.from(
              json['next_evolution'].map((x) => NextEvolution.fromJson(x)))
          : null,
    );
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
    data['candy_count'] = this.candyCount;
    data['egg'] = this.egg;
    data['spawn_chance'] = this.spawnChance;
    data['avg_spawns'] = this.avgSpawns;
    data['spawn_time'] = this.spawnTime;
    data['multipliers'] = this.multipliers;
    data['weaknesses'] = this.weaknesses;
    if (this.nextEvolution != null) {
      data['next_evolution'] =
          this.nextEvolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NextEvolution {
  String num;
  String name;

  NextEvolution({required this.num, required this.name});

  factory NextEvolution.fromJson(Map<String, dynamic> json) {
    return NextEvolution(
      num: json['num'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['num'] = this.num;
    data['name'] = this.name;
    return data;
  }
}
