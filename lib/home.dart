import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:myapp/models/user.dart';
import 'package:myapp/user_details.dart';
import 'package:myapp/user_list.dart';
import 'package:myapp/widgets/users_data_search.dart';

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

  void updateUsers(oldIndex, newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final User item = users.removeAt(oldIndex);
      users.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          widget.title, 
          style: const TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold
          )
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final User? selectedUser = await showSearch<User>(
                context: context,
                delegate: UsersDataSearch(users: users)
              );

              if (selectedUser != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailsPage(user: selectedUser),
                  ),
                );
              }
            },
            icon: const Icon(Icons.search, color: Colors.white)
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: UserListPage(
          users: users,
          updateUsers: updateUsers
        )
      )
    );
  }
}
