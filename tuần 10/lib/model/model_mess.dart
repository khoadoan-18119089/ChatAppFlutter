class ModelMess {
  final String isMe, messageType, message, profileImg;
  ModelMess(
      {required this.isMe,
      required this.messageType,
      required this.message,
      required this.profileImg});
  factory ModelMess.fromJson(Map<String, dynamic> json) {
    return ModelMess(
        isMe: json['isMe'],
        messageType: json['messageType'],
        message: json['message'],
        profileImg: json['profileImg']);
  }
}
