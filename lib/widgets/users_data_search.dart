import 'package:flutter/material.dart';

import 'package:myapp/models/user.dart';

class UsersDataSearch extends SearchDelegate<User> {
  final List<User> users;

  UsersDataSearch({required this.users});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop()
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<User> searchResults = users
        .where((item) => item.firstName!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].toString()),
          onTap: () {
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<User> suggestionList = query.isEmpty
      ? []
      : users
          .where((item) => item.firstName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
  
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].toString()),
          onTap: () {
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}
