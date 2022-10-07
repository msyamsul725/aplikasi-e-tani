import 'package:flutter/material.dart';
import 'package:taniv4/module/Register/controller/Register_controller.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //bodSiy
                  const SizedBox(height: 40),
                  const Center(
                    child: Text(
                      "Mulai",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 60),
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
                      const SizedBox(height: 60),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          controller: controller.passwordID,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Dengan Melanjutkan, kamu menyutujui Ketentuan Layanan dan Pemberitahuan Privasi Kami",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                          )
                        ],
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
                          onPressed: () => controller.registerSubmit(),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
