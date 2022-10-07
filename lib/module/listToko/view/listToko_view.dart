import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helper/api.dart';
import '../model/produk.dart';

class ProdukUi extends ChangeNotifier {
  List<Product> product = [];
  bool isLoading = true;

  ProdukUi() {
    getData();
  }

  void getData() {
    isLoading = true;
    notifyListeners();
    api.getProduk().then((value) {
      isLoading = false;
      if (value != null) {
        product = value;
      }
      notifyListeners();
    });
  }
}
