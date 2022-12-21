class GlossaryModel {
  final int id;
  final String? title;
  final String? description;
  GlossaryModel({
    required this.id,
    this.title,
    this.description,
  });

  factory GlossaryModel.fromJson(Map<String, dynamic> json) {
    return GlossaryModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
