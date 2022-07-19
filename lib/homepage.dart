import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/connection.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);
  Future<List<employees>> alluser() async {
    var responce = await rootBundle.loadString("assets/employees.json");
    final list = jsonDecode(responce) as List;
    print(list);
    print(list.length);
    if (responce.isNotEmpty) {
      return list.map((e) => employees.fromJson(e)).toList();
    } else
      return [];
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
      body: FutureBuilder(
          future: alluser(),
          builder: (context, AsyncSnapshot<List<employees>> s) {
            // var items = data.data as List<employees>;
            if (s.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: s.data!.length,
                itemBuilder: ((context, i) {
                  return ListTile(
                    title: Text(s.data![i].name!),
                    subtitle: Text(s.data![i].fname!),
                  );
                }));
          }),
    );
  }
}
