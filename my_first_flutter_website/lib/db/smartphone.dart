class Smartphone {
  Smartphone({
    required this.name,
    required this.picture,
    required this.ram,
    required this.battery_size,
    required this.display_resolution,
    //required this.released_at,

    required this.energie,
    required this.recycling,
    required this.langlebigkeit,
    required this.umweltverschmutzung,
    required this.soziale_verantwortung,
    required this.faire_arbeitsbedingungen,
    required this.transparenz,
});
  String name;
  String picture;
  String ram;
  String battery_size;
  String display_resolution;
  //String released_at;

  int energie;
  int recycling;
  int langlebigkeit;
  int umweltverschmutzung;
  int soziale_verantwortung;
  int faire_arbeitsbedingungen;
  int transparenz;

  double get score {
    double average = (energie + recycling + langlebigkeit + umweltverschmutzung + soziale_verantwortung + faire_arbeitsbedingungen + transparenz)/7;
    return average;
  }

  factory Smartphone.fromJson(Map<String, dynamic> json) {
    return Smartphone(
      name: json['name'],
      picture: json['picture'],
      ram: json['ram'],
      battery_size: json['battery_size'],
      display_resolution: json['display_resolution'],
      //released_at: json['released_at'],

      energie: int.parse(json['Energie']),
      recycling: int.parse(json['Recycling']),
      langlebigkeit: int.parse(json['Langlebigkeit']),
      umweltverschmutzung: int.parse(json['Umweltverschmutzung']),
      soziale_verantwortung: int.parse(json['Soziale_Verantwortung']),
      faire_arbeitsbedingungen: int.parse(json['Faire_Arbeitsbedingungen']),
      transparenz: int.parse(json['Transparenz']),
    );
  }
}