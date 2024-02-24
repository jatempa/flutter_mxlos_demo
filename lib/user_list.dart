import 'package:flutter/material.dart';

import 'package:myapp/models/user.dart';
import 'package:myapp/user_details.dart';

class UserListPage extends StatelessWidget {
  final List<User> users;
  final Function updateUsers;
  
  const UserListPage({
    super.key,
    required this.users,
    required this.updateUsers
  });

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];

        return _buildCardItem(user, context);
      },
      onReorder: ((oldIndex, newIndex) {
        updateUsers(oldIndex, newIndex);
      })
    );
  }

  Widget _buildCardItem(User user, BuildContext context) {
    return Card(
      key: ValueKey(user.id),
      color: Colors.transparent,
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
}
