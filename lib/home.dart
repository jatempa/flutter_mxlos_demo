import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:myapp/models/user.dart';
import 'package:myapp/user_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const usersData = 'assets/data/users.json';
  List<User> users = [];

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString(usersData);
    final usersMap = jsonDecode(jsonString) as List;

    setState(() {
      users = usersMap.map((userMap) {
        return User.fromJson(userMap);
      }).toList();
    });
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
        child: UserListPage(users: users)
      )
    );
  }
}
