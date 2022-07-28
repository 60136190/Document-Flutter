// ignore_for_file: prefer_is_empty

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class CustomListView extends StatefulWidget {
  const CustomListView({Key? key}) : super(key: key);

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.fetchUser();
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "https://randomuser.me/api/?results=20";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['results'];
      setState(() {
        users = items;
        isLoading = false;
      });
    } else {
      setState(() {
        users = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Custome listview',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (users.contains(null) || users.length < 0 || isLoading) {
      return const Center(
          child: CircularProgressIndicator(
        // change color indicator
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ));
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  Widget getCard(index) {
    var fullName = index['name']['first'] + " " + index['name']['last'];
    var email = index['email'];
    var image = index['picture']['thumbnail'];
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
          child: ListTile(
        title: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(60 / 2),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(image.toString()),
                  )),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                fullName.toString(),
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
              Text(
                email.toString(),
                style: TextStyle(fontSize: 10, color: Colors.pink[100]),
              ),
            ]),
          ],
        ),
      )),
    );
  }
}
