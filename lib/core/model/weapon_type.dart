import 'package:enum_to_string/enum_to_string.dart';

enum WeaponType {
  bow,
  catalyst,
  claymore,
  polearm,
  sword,
}

extension WeaponTypeExtension on WeaponType {
  String get imagePath {
    String elementName = EnumToString.convertToString(this);
    return "assets/images/weapon-icons/sword.png";
  }
}
