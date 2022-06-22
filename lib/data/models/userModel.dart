import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String username;
  late String emailAddress;
  late String phoneNumber;
  late String userUniqueId;
  late String profilePictureUrl;
  late String uid;
  late String bio;
  late List<dynamic> chatChannels;
  late List<dynamic> friendList;

  UserModel.name({
    required this.username,
    required this.emailAddress,
    required this.phoneNumber,
    required this.userUniqueId,
    required this.profilePictureUrl,
    required this.uid,
    required this.bio,
    required this.chatChannels,
    required this.friendList,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'emailAddress': emailAddress,
        'phoneNumber': phoneNumber,
        'userUniqueId': userUniqueId,
        'profilePictureUrl': profilePictureUrl,
        'uid': uid,
        'bio': bio,
        'chatChannels': chatChannels,
        'friendList': friendList,
      };

  static UserModel fromSnapshot(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserModel.name(
      username: snapshot['username'],
      emailAddress: snapshot['emailAddress'],
      phoneNumber: snapshot['phoneNumber'],
      userUniqueId: snapshot['userUniqueId'],
      profilePictureUrl: snapshot['profilePictureUrl'],
      uid: snapshot['uid'],
      bio: snapshot['bio'],
      chatChannels: snapshot['chatChannels'],
      friendList: snapshot['friendList'],
    );
  }
}
