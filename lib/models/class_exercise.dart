class Exercise {
  int ref;
  String title;
  String img;
  int time;
  int repeat;

  String category;
  String description;

  Exercise(this.ref, this.title, this.img, this.time, this.repeat,
      this.category, this.description);

  Map<String, dynamic> toJson() => {
    'ref': null,
    'title': title,
    'img': img,
    'time': time,
    'repeat': repeat,
    'category': category,
    'description': description,
  };
  static Exercise fromJson(Map<String, dynamic> json) {
    return Exercise(
        json['ref'] as int,
        json['title'] as String,
        json['img'] as String,
        json['time'] as int,
        json['repeat'] as int,
        json['category'] as String,
        json['description'] as String);
  }
  // int get ref => _ref;
  //
  // String get title => _title;
  //
  // String get img => _img;
  //
  // int get time => _time;
  //
  // int get repeat => _repeat;
  //
  // String get category => _category;
  //
  // String get description => _description;
  //
  // set ref(int ref) {
  //   _ref = ref;
  // }
  //
  // set title(String title) {
  //
  // }

}
