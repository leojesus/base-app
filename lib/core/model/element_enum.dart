import 'package:enum_to_string/enum_to_string.dart';

enum CharElement {
  anemo,
  cryo,
  dendro,
  electro,
  geo,
  hydro,
  pyro,
}

extension CharElementExtension on CharElement {
  String get imagePath {
    String elementName = EnumToString.convertToString(this);
    return "assets/images/elements/dendro.png";
  }
}
