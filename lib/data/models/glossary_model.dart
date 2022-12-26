class GlossaryModel {
  final int id;
  late final String? title;
  late final String? description;
  final bool? isFavourite;
  GlossaryModel({
    required this.id,
    this.title,
    this.description,
    this.isFavourite,
  });

  factory GlossaryModel.fromJson(Map<String, dynamic> json) {
    return GlossaryModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isFavourite: json['isFavourite'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title as String;
    data['description'] = this.description;
    data['isFavourite'] = this.isFavourite;
    return data;
  }
}
