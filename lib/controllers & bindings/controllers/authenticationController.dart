import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:only_friends/data/models/userModel.dart';
import 'package:only_friends/services/storageServices.dart';
import 'package:uuid/uuid.dart';

class AuthenticationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserModel? userModel;

  Future<String> signupUser({
    required String username,
    required String emailAddress,
    required String phone,
    required String password,
    required Uint8List profilePictureFile,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      String profilePictureUrl = await StorageServices().uploadPicture(
        directoryName: 'profilePicture',
        pictureFile: profilePictureFile,
        isPost: false,
      );
      if (profilePictureUrl == 'Error') {
        throw Exception();
      }
      String isSuccess = await _storeUserDataOnSignup(
        username: username,
        emailAddress: emailAddress,
        phone: phone,
        userUniquieId: Uuid().v1().substring(0, 6) + "-" + username,
        uid: userCredential.user!.uid,
        profilePictureUrl: profilePictureUrl,
      );
      if (isSuccess == 'Error') {
        throw Exception();
      }
      userModel = await _getUserModel();
      return "Success";
    } on FirebaseException catch (error) {
      return error.message ??
          "An error occurred while connecting to the server!";
    } catch (error) {
      return "An error occurred!";
    }
  }

  Future<String> signinUser({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      userModel = await _getUserModel();
      return "Success";
    } on FirebaseException catch (error) {
      return error.message ??
          "An error occurred while connecting to the server!";
    } catch (error) {
      print(error);
      return "An error occurred!";
    }
  }

  Future<String> _storeUserDataOnSignup(
      {required String username,
      required String emailAddress,
      required String phone,
      required String userUniquieId,
      required String uid,
      required String profilePictureUrl}) async {
    try {
      UserModel user = UserModel.name(
        username: username,
        emailAddress: emailAddress,
        phoneNumber: phone,
        userUniqueId: userUniquieId,
        profilePictureUrl: profilePictureUrl,
        uid: uid,
        bio: "",
        chatChannels: [],
        friendList: [],
      );
      await _firestore.collection('users').doc(uid).set(user.toJson());
      return "Success";
    } catch (error) {
      return "Error";
    }
  }

  Future<String> signoutUser() async {
    try {
      _auth.signOut();
      userModel = await _getUserModel();
      return "Success";
    } on FirebaseException catch (error) {
      return error.message ??
          "An error occurred while connecting to the server!";
    } catch (error) {
      return "An error occurred!";
    }
  }

  Future<UserModel> _getUserModel() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromSnapshot(documentSnapshot);
  }

  Future<bool> isUserSignedIn() async {
    if (_auth.currentUser != null) {
      userModel = await _getUserModel();
      return true;
    } else {
      return false;
    }
  }
}
