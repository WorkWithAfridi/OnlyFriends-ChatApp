import 'package:cloud_firestore/cloud_firestore.dart';

class ChatChannelModel {
  late String chatChannelId;
  late String chatChannelName;
  late String chatChannelImageUrl;
  late List<dynamic> users;

  ChatChannelModel.name({
    required this.chatChannelId,
    required this.chatChannelName,
    required this.chatChannelImageUrl,
    required this.users,
  });

  Map<String, dynamic> toJson() => {
        'chatChannelId': chatChannelId,
        'chatChannelName': chatChannelName,
        'chatChannelImageUrl': chatChannelImageUrl,
        'users': users,
      };

  static ChatChannelModel fromSnapshot(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return ChatChannelModel.name(
      chatChannelId: snapshot['chatChannelId'],
      chatChannelImageUrl: snapshot['chatChannelImageUrl'],
      chatChannelName: snapshot['chatChannelName'],
      users: snapshot['users'],
    );
  }
}
