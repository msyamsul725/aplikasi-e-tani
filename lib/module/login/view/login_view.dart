// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:taniv4/module/login/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  bool isLoging = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/login.png',
                    height: 300,
                    width: 400,
                  ),
                  const SizedBox(height: 25),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: controller.emailID,
                          decoration: const InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: controller.passwordID,
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Container(
                        height: 55,
                        width: 330,
                        decoration: const BoxDecoration(
                          color: Color(0xff1c8220),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              30.0,
                            ),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () => controller.loginSubmit(),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                              icon: const Icon(MdiIcons.google),
                              label: const Text("Google"),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () => controller.googleLogin()),
                          const SizedBox(
                            width: 10.0,
                          ),
                          ElevatedButton.icon(
                            icon: const Icon(MdiIcons.facebook),
                            label: const Text("Facebook"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey,
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
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
