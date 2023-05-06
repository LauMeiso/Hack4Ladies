class Smartphone {
  Smartphone({
    required this.name,
    required this.picture,
});
  String name;
  String picture;

  factory Smartphone.fromJson(Map<String, dynamic> json) {
    return Smartphone(
      name: json['name'],
      picture: json['picture'],
    );
  }
}