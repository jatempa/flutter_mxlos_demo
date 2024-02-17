import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var jsonData;

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/data/users.json');
    final data = jsonDecode(jsonString);
    print(data);
  }

  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(12),
        child: ListView(
          children: const [
            Card(
              child: ListTile(
                title: Text("Demo"),
              ),
            )
          ],
        ),
      )
    );
  }
}
