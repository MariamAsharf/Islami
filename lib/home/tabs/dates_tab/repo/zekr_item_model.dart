class ZekrItemModel {
  final String? category;
  final String? count;
  final String? description;
  final String? reference;
  final String? content;

  ZekrItemModel({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  factory ZekrItemModel.fromJson(Map<String, dynamic> json) {
    return ZekrItemModel(
      category: json['category'],
      count: json['count'],
      description: json['description'],
      reference: json['reference'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'count': count,
      'description': description,
      'reference': reference,
      'content': content,
    };
  }
}
