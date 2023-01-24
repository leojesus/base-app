import 'package:enum_to_string/enum_to_string.dart';
import 'package:genshin_builder/core/model/element_enum.dart';
import 'package:genshin_builder/core/model/weapon_type.dart';

class Char {
  final String name;
  final CharElement element;
  final int rarity;
  final WeaponType weaponType;
  final String title;
  final String birthday;
  final String association;
  final String constelation;
  final String description;

  Char({
    required this.name,
    required this.element,
    required this.rarity,
    required this.weaponType,
    required this.title,
    required this.birthday,
    required this.association,
    required this.constelation,
    required this.description,
  });

  String get imagePath {
    String image = name.replaceAll("'", "").replaceAll("\"", "");
    return "assets/images/chars/Alhaitham.png";
  }

  factory Char.fromDb(Map<String, dynamic> dbItem) {
    final rarityParsed = int.tryParse(dbItem["rarity"]) ?? 4;
    final elementParsed = EnumToString.fromString(CharElement.values, dbItem["element"]) ?? CharElement.anemo;
    final weaponTypeParsed = EnumToString.fromString(WeaponType.values, dbItem["weapon"]) ?? WeaponType.bow;

    return Char(
      name: dbItem["name"],
      element: elementParsed,
      rarity: rarityParsed,
      weaponType: weaponTypeParsed,
      title: dbItem["title"],
      birthday: dbItem["birthday"],
      association: dbItem["association"],
      constelation: dbItem["constelation"],
      description: dbItem["description"],
    );
  }
}
