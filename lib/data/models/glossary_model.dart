class GlossaryModel {
  final int id;
  late final String? title;
  late final String? description;
  final bool isFavourite;
  GlossaryModel({
    required this.id,
    this.title,
    this.description,
    required this.isFavourite,
  });

  factory GlossaryModel.fromJson(Map<String, dynamic> json) {
    return GlossaryModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isFavourite: json['isFavourite'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'isFavourite': isFavourite,
      };
}
