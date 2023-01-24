enum CharMaterialType { ascension, talent }

class CharMaterial {
  final String charName;
  final String material;
  final String quantity;
  final String rarity;
  final CharMaterialType type;

  CharMaterial({required this.charName, required this.material, required this.quantity, required this.rarity, required this.type});

  String get imagePath {
    return "assets/images/materials/$material.png";
  }

  String get rarityImagePath {
    return "assets/images/materials/rarity/$rarity.png";
  }

  factory CharMaterial.fromDb(Map<String, dynamic> dbItem, CharMaterialType type) {
    return CharMaterial(
        charName: dbItem["charName"], material: dbItem["material"], quantity: dbItem["quantity"], rarity: dbItem["rarity"], type: type);
  }
}
