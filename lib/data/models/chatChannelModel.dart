import 'package:cloud_firestore/cloud_firestore.dart';

class ChatChannelModel {
  late String chatChannelId;
  late List<dynamic> users;

  ChatChannelModel.name({
    required this.chatChannelId,
    required this.users,
  });

  Map<String, dynamic> toJson() => {
        'chatChannelId': chatChannelId,
        'users': users,
      };

  static ChatChannelModel fromSnapshot(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return ChatChannelModel.name(
      chatChannelId: snapshot['chatChannelId'],
      users: snapshot['users'],
    );
  }
}
