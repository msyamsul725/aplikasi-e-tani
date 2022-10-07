import 'package:flutter/material.dart';

import '../controller/message_controller.dart';

import 'package:get/get.dart';

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      init: MessageController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("message"),
            backgroundColor: const Color(0xff1C8220),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: controller.peoples.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // cara ngambil item dari conttroler
                      var item = controller.peoples[index];

                      return InkWell(
                        onTap: () {
                          // controller.peoples.removeAt(index);
                          // controller.update();
                          controller.selectedIndex = index;
                          Get.to(ListView());
                        },
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              backgroundImage: NetworkImage(
                                item["photo"],
                              ),
                            ),
                            title: Text(item["name"]),
                            subtitle: Text(item["job"]),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
