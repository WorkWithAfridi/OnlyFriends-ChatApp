import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageServices {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadPicture({
    required String directoryName,
    required Uint8List pictureFile,
    required bool isPost,
  }) async {
    try {
      Reference ref =
          _storage.ref().child(directoryName).child(_auth.currentUser!.uid);

      if (isPost) {
        String documentId = Uuid().v1();
        ref = ref.child(documentId);
      }

      UploadTask uploadTask = ref.putData(pictureFile);

      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (error) {
      return "Error";
    }
  }
}
