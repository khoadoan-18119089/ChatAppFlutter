class Message {
  String message;
  String senByMe;
  int id;
  Message({required this.id,required this.message, required this.senByMe});
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(id: json["id"], message: json["message"], senByMe: json["sentByMe"]);
  }
}
