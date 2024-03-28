class PokeHub {
  List<Pokemon?> pokemon;

  PokeHub({required this.pokemon});

  factory PokeHub.fromJson(Map<String, dynamic> json) {
    return PokeHub(
      pokemon: List<Pokemon?>.from(
          json['pokemon'].map((x) => Pokemon.fromLocalJson(x))),
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
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  List<String> weaknesses;
  List<NextEvolution>? nextEvolution;

  Pokemon(
      {required this.id,
      required this.name,
      required this.img,
      required this.type,
      required this.height,
      required this.weight,
      required this.weaknesses,
      this.nextEvolution});

  factory Pokemon.fromLocalJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      img: json['img'],
      type: List<String>.from(json['type']),
      height: json['height'],
      weight: json['weight'],
      weaknesses: List<String>.from(json['weaknesses']),
      nextEvolution: json['next_evolution'] != null
          ? List<NextEvolution>.from(
              json['next_evolution'].map((x) => NextEvolution.fromJson(x)))
          : null,
    );
  }

  factory Pokemon.fromPokeAPIJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      img: json['sprites']["other"]["official-artwork"]["front_default"],
      type: List<String>.from(json['types'].map((x) => x['type']['name'])),
      height: json['height'],
      weight: json['weight'],
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
    data['name'] = this.name;
    data['img'] = this.img;
    data['type'] = this.type;
    data['height'] = this.height;
    data['weight'] = this.weight;
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
