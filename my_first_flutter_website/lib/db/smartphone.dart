class Smartphone {
  Smartphone({
    required this.name,
    required this.picture,

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

  int energie;
  int recycling;
  int langlebigkeit;
  int umweltverschmutzung;
  int soziale_verantwortung;
  int faire_arbeitsbedingungen;
  int transparenz;

  factory Smartphone.fromJson(Map<String, dynamic> json) {
    return Smartphone(
      name: json['name'],
      picture: json['picture'],

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