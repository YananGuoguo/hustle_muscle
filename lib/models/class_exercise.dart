class Exercise {
  int? id;
  String? title;
  String? img;
  int? time;
  int? repeat;
  String? category;
  String? description;

  Exercise({this.id, this.title, this.img, this.time, this.repeat, this.category,
      this.description});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['img'] = img;
    data['time'] = time;
    data['repeat'] = repeat;
    data['category'] = category;
    data['description'] = description;
    return data;
  }

  Exercise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
    time = json['time'];
    repeat = json['repeat'];
    category = json['category'];
    description = json['description'];
  }
}
