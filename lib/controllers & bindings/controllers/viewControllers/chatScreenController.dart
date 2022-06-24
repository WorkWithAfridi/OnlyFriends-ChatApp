import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/firebaseController.dart';

import '../../../data/models/userModel.dart';

class ChatScreenController extends GetxController {
  var messageTextEditingController = TextEditingController().obs;
  ScrollController scrollController = ScrollController();
  late UserModel chatFriendUserModel;
  late String chatChannelId;
  final FirebaseController firebaseController = Get.find();

  sendMessage() async {
    String isSUccess = await firebaseController.sendMessage(
        chatChannelId: chatChannelId,
        message: messageTextEditingController.value.text);
    if (isSUccess == "Success") {
      messageTextEditingController.value.text = '';
    }
  }
}
