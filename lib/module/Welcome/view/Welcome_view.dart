import 'package:flutter/material.dart';
import 'package:taniv4/module/Register/view/Register_view.dart';
import 'package:taniv4/module/login/view/login_view.dart';
import '../controller/Welcome_controller.dart';

import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) {
        controller.view = this;

        /*
        ------------------------
        https://capekngoding.com
        ------------------------
        Starring:
        Name: Flutter Way
        Youtube: https: //www.youtube.com/c/TheFlutterWay/playlists?app=desktop
        ------------------------
        [1] Update pubspec.yaml
        flutter_svg:
        
        [2] Import
        import 'package:flutter_svg/svg.dart';
        ------------------------
        Code generation with snippets can be a good solution for you or it can kill you.
        A basic understanding of Dart and Flutter is required.
        Keep it in mind, Our snippet can't generate many files yet.
        So, all of our snippets are put in one file which is not best practice.
        You need to do the optimization yourself, and at least you are familiar with using Flutter.
        ------------------------
        */

        return Theme(
          data: ThemeData(
            primaryColor: const Color(0xff1C8220),
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: const Color(0xff1C8220),
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
          ),
          child: Scaffold(
            body: SingleChildScrollView(
              controller: ScrollController(),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SafeArea(
                      child: SingleChildScrollView(
                        child: SafeArea(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: [
                                  const Text("Welcome To MyApp",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xff81C784),
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 16.0 * 2),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Expanded(
                                        flex: 8,
                                        child: Image.asset(
                                          "assets/image/wc.png",
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  const SizedBox(height: 16.0 * 2),
                                ],
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      children: [
                                        Hero(
                                          tag: "login_btn",
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return LoginView();
                                                  },
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "Login".toUpperCase(),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return const RegisterView();
                                                },
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: const Color(0xffBAEBBC),
                                              elevation: 0),
                                          child: Text(
                                            "Sign Up".toUpperCase(),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
