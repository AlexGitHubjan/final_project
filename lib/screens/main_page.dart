import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itogovaya_rabota/screens/detail_screen.dart';
import 'package:itogovaya_rabota/screens/model/clases.dart';

Future<List<User>> getData() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

ListView _usersListView(List<User> data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  user: data[index],
                ),
              ),
            );
          },
          child: Card(
              color: const Color.fromARGB(255, 27, 25, 37),
              elevation: 10,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  data[index].name,
                  style: const TextStyle(
                      fontFamily: 'Umbrella',
                      color: Colors.white,
                      fontSize: 17),
                ),
                subtitle: Text(
                  data[index].email,
                  style: const TextStyle(
                      fontFamily: 'Umbrella',
                      color: Colors.white,
                      fontSize: 13),
                ),
                leading: Image.asset(
                  'assets/bio.png',
                  height: 29,
                  color: Colors.red,
                ),
              )),
        );
      });
}

class UmbrellaApp extends StatefulWidget {
  const UmbrellaApp({Key? key}) : super(key: key);

  @override
  State<UmbrellaApp> createState() => _UmbrellaAppState();
}

class _UmbrellaAppState extends State<UmbrellaApp> {
  late List<User> users;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset(
                  'assets/wp.jpeg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/about',
                  );
                },
                title: const Text('About'),
              ),
              ListTile(
                title: const Text('Exit'),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/login',
                  );
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text(
            'Umbrella\nSecret Staff',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Umbrella',
              fontSize: 18,
            ),
          ),
          actions: [
            SizedBox(
              width: 98,
              child: Image.asset(
                'assets/umbrellatext.png',
              ),
            ),
          ],
        ),
        body: Center(
          child: FutureBuilder<List<User>>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  users = snapshot.data!;
                  return _usersListView(users);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
