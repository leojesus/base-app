import 'package:enum_to_string/enum_to_string.dart';
import 'package:genshin_builder/core/model/weapon_type.dart';

class Weapon {
  Weapon(this.name, this.type, this.baseAtk, this.rarity, this.secondaryStat);

  String name;
  WeaponType type;
  int baseAtk;
  int rarity;
  String secondaryStat;

  String get imagePath {
    String image = name.replaceAll("'", "").replaceAll("\"", "");
    return "assets/images/weapons/A Thousand Floating Dreams.png";
  }

  factory Weapon.fromDb(Map<String, dynamic> dbItem) {
    final rarityParsed = int.tryParse(dbItem["rarity"]) ?? 4;
    final baseAtkParsed = int.tryParse(dbItem["baseAtk"]) ?? 0;
    final weaponTypeParsed = EnumToString.fromString(WeaponType.values, dbItem["type"]) ?? WeaponType.bow;
    return Weapon(dbItem["name"], weaponTypeParsed, baseAtkParsed, rarityParsed, dbItem["secondaryStat"]);
  }
}
