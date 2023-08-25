import 'package:flutter/material.dart';

import 'package:rest_api_call/model/user.dart';
import 'package:rest_api_call/services/user_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rest API Call'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(user.picture.thumbnail),
              ),
              title: Text(user.fullName),
              subtitle: Text(user.location.country),
              trailing: Text(user.dob.age.toString()));
        },
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    if (response.isNotEmpty) {
      setState(() {
        users = response;
      });
    } else {
      print('Nop Response from APi');
    }
  }
}
