import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  late String messageId;
  late String ownerUid;
  late String message;

  MessageModel.name({
    required this.messageId,
    required this.ownerUid,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
        'messageId': messageId,
        'message': message,
        'ownerUid': ownerUid,
      };

  static MessageModel fromSnapshot(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return MessageModel.name(
      messageId: snapshot['messageId'],
      message: snapshot['message'],
      ownerUid: snapshot['ownerUid'],
    );
  }
}
