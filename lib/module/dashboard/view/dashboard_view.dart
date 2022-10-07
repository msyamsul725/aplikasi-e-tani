// ignore_for_file: avoid_print

import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:camera_platform_interface/src/types/camera_description.dart'
    show CameraDescription;
import 'package:taniv4/main.dart';
import 'package:taniv4/module/homeMarket/view/homeMarket_view.dart';
import 'package:taniv4/module/login/view/login_view.dart';
import 'package:taniv4/module/mainpage/view/mainpage_view.dart';
import 'package:taniv4/module/message/view/message_view.dart';
import 'package:get/get.dart';

import '../../drawerscreen/view/drawerscreen_view.dart';

class DashboardView extends StatelessWidget {
  DashboardView(List<CameraDescription> cameras, {Key? key}) : super(key: key);

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1C8220),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  _signOut().then((value) => Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginView())));
                },
                child: const Icon(Icons.highlight_off)),
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 10),
          color: Colors.white,
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hi  ",
                      style: TextStyle(
                          color: Color(0xff1C8220),
                          fontSize: 14,
                          fontWeight: FontWeight.w800)),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: auth.currentUser!.email,
                          style: const TextStyle(
                              color: Color(0xff1C8220),
                              fontSize: 14,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Lets Go",
                      style: TextStyle(
                          color: Color(0xff1C8220),
                          fontSize: 30,
                          fontWeight: FontWeight.w800)),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  " Your Dream MyFarM",
                  style: TextStyle(
                      color: Color(0xff1C8220),
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xff1C8220))),
                child: TextFormField(
                  decoration: const InputDecoration.collapsed(
                      hintText: "Search Farm or Education"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Menu Option",
                  style: TextStyle(
                      color: Color(0xff1C8220),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 20),
              farm_item(context),
              Container(),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox farm_item(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xffe9ffeb),
                borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainPageView(cameras);
                }));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/image/object_detection.png",
                    height: 100,
                    width: 150,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "      Object Detection",
                    style: TextStyle(
                      color: Color(0xff1C8220),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: const Color(0xffe9ffeb),
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () => Get.to(const MessageView()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/image/temp.png",
                      height: 100,
                      width: 150,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "      Temperature",
                      style: TextStyle(
                        color: Color(0xff1C8220),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xffe9ffeb),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/image/edu.png",
                  height: 100,
                  width: 150,
                ),
                const SizedBox(height: 16),
                const Text(
                  "      Education",
                  style: TextStyle(
                    color: Color(0xff1C8220),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: const Color(0xffe9ffeb),
                borderRadius: BorderRadius.circular(10)),
            child: InkWell(
                onTap: () => Get.to(const HomeMarketView()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/image/market.png",
                      height: 100,
                      width: 150,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "           Market",
                      style: TextStyle(
                        color: Color(0xff1C8220),
                        fontSize: 14,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
