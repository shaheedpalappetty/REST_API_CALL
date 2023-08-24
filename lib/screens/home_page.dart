import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rest API Call'),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton.extended(
          onPressed: fetchUsers,
          label: const Text('Fetch User Data'),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(user['picture']['thumbnail'])),
            title: Text((user['name']['title'] +
                ' ' +
                user['name']['first'] +
                ' ' +
                user['name']['last'])),
            subtitle: Text(user['gender']),
          );
        },
      ),
    );
  }

  void fetchUsers() async {
    print('Fetch Users Called');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      users = json['results'];
    });
    print('FEtch USers Completed');
    print(users);
  }
}
