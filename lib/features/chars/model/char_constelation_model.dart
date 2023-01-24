class CharConstelation {
  final String charName;
  final String constelationName;
  final String description;

  CharConstelation({
    required this.charName,
    required this.constelationName,
    required this.description,
  });

  String get imagePath {
    String image = '$charName-$constelationName';
    return "assets/images/char-skills/$image.png";
  }

  factory CharConstelation.fromDb(Map<String, dynamic> dbItem) {
    return CharConstelation(
      charName: dbItem["charName"],
      constelationName: dbItem["constelationName"],
      description: dbItem["description"],
    );
  }
}
