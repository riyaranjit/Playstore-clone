import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  final apps = ["Facebook", "Messenger", "Linkedin", "Temple Run", "Instagram"];

  final recentapps = ["Facebook", "Messenger"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('abc');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestList = query.isEmpty ? recentapps : apps;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.history),
        title: Text(suggestList[index]),
      ),
      itemCount: suggestList.length,
    );
  }
}