import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:itogovaya_rabota/screens/model/clases.dart';
import 'package:itogovaya_rabota/screens/model/list.dart';

class DetailScreen extends StatefulWidget {
  User? user;

  DetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late List<MyList> todo;

  Future<List<MyList>> _fetchToDoList(int id) async {
    final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/todos?userId=$id"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => MyList.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  ListView _usersToDoView(List<MyList> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
              color: const Color.fromARGB(255, 27, 25, 37),
              elevation: 10,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                  title: Text(
                    data[index].title,
                    style: const TextStyle(
                        fontFamily: 'Umbrella',
                        color: Colors.white,
                        fontSize: 14),
                  ),
                  leading: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.white30,
                    ),
                    child: Checkbox(
                      onChanged: (bool? value) {},
                      value: data[index].completed,
                      checkColor: Colors.red,
                      activeColor: const Color.fromARGB(255, 27, 25, 37),
                    ),
                  )));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Agent Info',
            style: TextStyle(
                fontFamily: 'Umbrella', color: Colors.white, fontSize: 18),
          ),
        ),
        body: Column(
          children: [
            Card(
              elevation: 10,
              color: const Color.fromARGB(255, 27, 25, 37),
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/girl.gif',
                    height: 120,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.user?.name ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'Umbrella',
                          color: Colors.white,
                          fontSize: 26),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Code name: ${widget.user?.username}"),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 4),
                        child:
                            Text("Company name: ${widget.user?.company.name}"),
                      ),
                      Text("BS: ${widget.user?.company.bs}"),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 4),
                        child: Text(
                            "Secret Phrase:\n${widget.user?.company.catchPhrase}"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.add_location_sharp,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Location established..."),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Street: ${widget.user?.address.street}"),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text("Suite: ${widget.user?.address.suite}"),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            Text("City: ${widget.user?.address.city}"),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 40,
                            ),
                            Text("ZipCode: ${widget.user?.address.zipcode}"),
                          ],
                        ),
                        Divider(
                          color: Colors.white30,
                        ),
                        const Text('Current mission:')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<MyList>>(
                future: _fetchToDoList(widget.user?.id ?? 0),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    todo = snapshot.data!;
                    return Expanded(child: _usersToDoView(todo));
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
