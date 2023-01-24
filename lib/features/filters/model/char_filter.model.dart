import 'package:genshin_builder/core/model/element_enum.dart';
import 'package:genshin_builder/core/model/weapon_type.dart';

class CharFilter {
  String charName;
  List<CharElement> elements;
  List<int> rarities;
  List<WeaponType> weaponTypes;

  CharFilter(this.charName, this.elements, this.rarities, this.weaponTypes);
}
