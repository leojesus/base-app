class CharTalent {
  final String charName;
  final String talentName;
  final String type;
  final String priority;
  final String description;
  final String gifUrl;

  CharTalent({
    required this.charName,
    required this.talentName,
    required this.type,
    required this.priority,
    required this.description,
    required this.gifUrl,
  });

  String get imagePath {
    String image = '$charName-${talentName.replaceAll("/", ":")}';
    return "assets/images/char-skills/$image.png";
  }

  factory CharTalent.fromDb(Map<String, dynamic> dbItem) {
    return CharTalent(
      charName: dbItem["charName"],
      talentName: dbItem["talentName"],
      type: dbItem["type"],
      priority: dbItem["priority"],
      description: dbItem["description"],
      gifUrl: dbItem["gifUrl"],
    );
  }
}
