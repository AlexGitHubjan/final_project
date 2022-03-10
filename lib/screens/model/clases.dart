class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Company company;
  final Address address;

  User(
      {required this.company,
      required this.username,
      required this.id,
      required this.name,
      required this.email,
      required this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      company: Company.fromJson(json["company"]),
      address: Address.fromJson(json["address"]),
      username: json["username"],
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address(
      {required this.city,
      required this.street,
      required this.suite,
      required this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json["city"],
      street: json['street'],
      suite: json['suite'],
      zipcode: json['zipcode'],
    );
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.bs,
    required this.name,
    required this.catchPhrase,
  });
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      catchPhrase: json["catchPhrase"],
      name: json['name'],
      bs: json['bs'],
    );
  }
}

class Geo {
  final Geo geo;

  Geo({
    required this.geo,
  });

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      geo: Geo.fromJson(json['geo']),
    );
  }
}
