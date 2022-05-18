class Category {
  int? id;
  String? category;
  String? thumbnail;

  Category({this.id, this.category, this.thumbnail});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    return data;
  }

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    thumbnail = json['thumbnail'];
  }
}
