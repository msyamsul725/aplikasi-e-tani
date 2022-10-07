// ignore_for_file: unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/Register_view.dart';

class RegisterController extends GetxController {
  RegisterView? view;

  late TextEditingController emailID = TextEditingController();
  late TextEditingController passwordID = TextEditingController();

  Future<void> registerSubmit() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailID.text,
        password: passwordID.text,
      );
      Get.snackbar("Akun berhasil di Daftarkan", (emailID.text));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
