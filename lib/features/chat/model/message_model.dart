class MessageModel {
  late final String date;
  late final String senderId;
  late final String receiverId;
  late final String text;

  MessageModel({
    required this.date,
    required this.senderId,
    required this.receiverId,
    required this.text,
  });

  factory MessageModel.fromMap(Map<String, dynamic> json) {
    return MessageModel(
      date: json['date'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
    };
  }
}
