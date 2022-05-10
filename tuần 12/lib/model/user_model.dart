class User {
  String id, name, img;
  bool online, story;
  String message, createdAt;
  User({
    required this.id,
    required this.name,
    required this.img,
    required this.online,
    required this.story,
    required this.message,
    required this.createdAt,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      img: json['img'],
      online: json['online'],
      story: json['story'],
      message: json['message'],
      createdAt: json['created_at'],
    );
  }
}
