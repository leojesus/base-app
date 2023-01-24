import 'package:genshin_builder/core/model/weapon_type.dart';

class WeaponFilter {
  String weaponName;
  List<int> rarities;
  List<WeaponType> weaponTypes;

  WeaponFilter(this.weaponName, this.rarities, this.weaponTypes);
}
