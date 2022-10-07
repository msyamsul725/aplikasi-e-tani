import 'package:get/get.dart';
import '../view/message_view.dart';

class MessageController extends GetxController {
  MessageView? view;
  int counter = 4;
  int selectedIndex = 0;
  List peoples = [
    {
      "name": "syamsul",
      "photo": "https://i.ibb.co/PGv8ZzG/me.jpg",
      "job": "programmer",
    },
    {
      "name": "risma",
      "photo": "https://i.ibb.co/PGv8ZzG/me.jpg",
      "job": "programmer",
    },
    {
      "name": "andi",
      "photo": "https://i.ibb.co/PGv8ZzG/me.jpg",
      "job": "programmer",
    },
    {
      "name": "kameru",
      "photo": "https://i.ibb.co/PGv8ZzG/me.jpg",
      "job": "programmer",
    },
  ];

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }
}
