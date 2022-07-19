import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/catalog.dart';
import 'package:flutter_application_1/connection.dart';
import 'package:flutter_application_1/itemwidget.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  // Future<List<employees>> alluser() async {
  //   var responce = await rootBundle.loadString("assets/employees.json");
  //   final list = jsonDecode(responce) as List<dynamic>;
  //   if (responce.isNotEmpty) {
  //     return list.map((e) => employees.fromJson(e)).toList();
  //   } else
  //     return [];
  // }
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/employees.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["Users"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Employees',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: CatalogModel.items?.length,
          itemBuilder: (context, index) => ItemWidget(
            item: CatalogModel.items![index],
          ),
        ));
  }
}
