class GlossaryModel {
  final int? id;
  final String? title;
  final String? description;

  GlossaryModel({
    this.id,
    this.title,
    this.description,
  });

  factory GlossaryModel.fromJson(Map<String, dynamic> json) {
    return GlossaryModel(
      id: json['id'],
      title: json['title'],
      description: json['discraption'],
    );
  }
}
