class GlossaryModel {
  final int id;
  final String? title;
  final String? description;

  GlossaryModel({
    required this.id,
    this.title,
    this.description,
  });

  factory GlossaryModel.fromJson(json) {
    return GlossaryModel(
      id: json['id'],
      title: json['title'],
      description: json['discraption'],
    );
  }
}
