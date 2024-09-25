class Noodle {
  String title;
  String description;
  double score;
  List<String> images;
  bool isFavorite;

  Noodle({
    required this.title,
    required this.description,
    required this.score,
    required this.images,
    this.isFavorite = false,
  });
}
