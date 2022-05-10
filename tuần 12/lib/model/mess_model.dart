class Message {
  String message;
  String senByMe;
  int id;
  String sentByYou;
  String messageType;
  Message({
    required this.id,
    required this.message,
    required this.senByMe,
    required this.sentByYou,
    required this.messageType
  });
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json["id"],
      message: json["message"],
      senByMe: json["sentByMe"],
      sentByYou: json['sentByYou'],
      messageType: json["messageType"]
    );
  }
}
