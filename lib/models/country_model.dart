class Country {
  Name? name;
  Flags? flags;

  Country({this.name, this.flags});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    flags = json['flags'] != null ? new Flags.fromJson(json['flags']) : null;
  }
}

class Name {
  String? common;

  Name({this.common});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
  }
}

class Flags {
  String? png;

  Flags({this.png});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
  }
}
