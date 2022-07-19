import 'dart:convert';

class CatalogModel {
  static List<Item>? items;
}

class Item {
  final String name;
  final String fname;
  final String Pno;

  Item({
    required this.name,
    required this.fname,
    required this.Pno,
  });

  Item copyWith({
    required String name,
    required String fname,
    required String Pno,
  }) {
    return Item(
      name: name,
      fname: fname,
      Pno: Pno,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'fname': fname,
      'Pno': Pno,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    // ignore: unnecessary_null_comparison

    return Item(
      name: map['name'],
      fname: map['fname'],
      Pno: map['Pno'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item( name: $name,fname: $fname,Pno: $Pno )';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item && o.name == name && o.fname == fname && o.Pno == Pno;
  }

  @override
  int get hashCode {
    return name.hashCode ^ fname.hashCode ^ Pno.hashCode;
  }
}
