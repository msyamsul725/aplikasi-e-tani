import 'package:flutter/material.dart';
import 'package:taniv4/module/listToko/view/listToko_view.dart';
import 'package:provider/provider.dart';

import '../model/produk.dart';

class MyTokoPage extends StatefulWidget {
  const MyTokoPage({Key? key}) : super(key: key);

  @override
  State<MyTokoPage> createState() => _MyTokoPageState();
}

class _MyTokoPageState extends State<MyTokoPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ProdukUi())],
      child: Consumer<ProdukUi>(builder: (context, produkprovider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'New List',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(0.8),
            child: produkprovider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Color(0xFF37AEEE),
                  ))
                : ListView.builder(
                    itemCount: produkprovider.product.length,
                    itemBuilder: (context, index) {
                      Product data = produkprovider.product[index];
                      return InkWell(
                        onTap: () async {
                          //detail
                          onClick();
                        },
                        child: Card(
                          shadowColor: Colors.black,
                          child: ListTile(
                            leading: Image.network(
                              data.thumbnail,
                            ),
                            title: Text(
                              data.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              data.description,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        );
      }),
    );
  }

  void onClick() {}
}
