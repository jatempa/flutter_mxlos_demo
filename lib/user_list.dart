import 'package:flutter/material.dart';

import 'package:myapp/models/user.dart';
import 'package:myapp/user_details.dart';

class UserListPage extends StatelessWidget {
  final List<User> users;
  
  const UserListPage({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          elevation: 0,
          child: ListTile(
            title: Text(user.toString()),
            subtitle: Text(user.email!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsPage(user: user),
                ),
              );
            },
          ),
        );
      }
    );    
  }
}