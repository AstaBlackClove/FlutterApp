import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const int itemCount = 20;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final url = 'https://random-data-api.com/api/v2/users?size=10&is_xml=true';
  final url1 = 'https://randomuser.me/api/?results=10';

  void fetchApi() async {
    print('Api triggered');
    final uri = Uri.parse(url1);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    print('Api Completed = ${json}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          setState(() {
            Text('${json}');
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchApi,
        child: const Icon(Icons.add),
      ),
    );
  }
}
