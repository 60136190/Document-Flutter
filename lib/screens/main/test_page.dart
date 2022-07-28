import 'package:flutter/material.dart';
import 'package:untitled2/screens/auth/login.dart';
import 'package:untitled2/screens/auth/register.dart';
import 'package:untitled2/screens/firebase_authentication.dart';
import 'package:untitled2/screens/list_user_firestore.dart';
import 'package:untitled2/screens/riverpod_page.dart';
import 'package:untitled2/screens/widget/register_firebase_auth.dart';

import '../custom_listview.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const LoginPage();
                }));
              },
              child: const Text('Login BloC'),
            ),
          ),

          // ui register
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return RegisterPage();
                }));
              },
              child: const Text('Register firebase using firestore'),
            ),
          ),

          // Firebase Authentication
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.yellow),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return FirebaseAuthPage();
                }));
              },
              child: const Text('Firebase Authentication'),
            ),
          ),

          // custom list view
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return CustomListView();
                }));
              },
              child: const Text('List view rest api'),
            ),
          ),

          // list view firestore
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ListUserFirestorePage();
                }));
              },
              child: const Text('List view from firestore'),
            ),
          ),

          // riverpod
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return RiverpodPage();
                }));
              },
              child: const Text('Using riverpod'),
            ),
          ),
        ]),
      ),
    );
  }
}
