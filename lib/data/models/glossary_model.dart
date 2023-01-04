class GlossaryModel {
  late final int? id;
  late final String? title;
  late final String? description;
  final bool isFavourite;
  final bool isChecked;
  GlossaryModel({
    this.id,
    this.title,
    this.description,
    required this.isFavourite,
    required this.isChecked,
  });

  factory GlossaryModel.fromJson(Map<String, dynamic> json) {
    return GlossaryModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isFavourite: json['isFavourite'],
      isChecked: json['isChecked'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'isFavourite': isFavourite,
        'isChecked': isChecked,
      };
}
