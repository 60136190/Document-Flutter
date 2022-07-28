import 'package:flutter/material.dart';
import 'package:untitled2/screens/main/home_page.dart';
import 'package:untitled2/screens/main/learn_page.dart';
import 'package:untitled2/screens/main/profile_page.dart';
import 'package:untitled2/screens/main/test_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: prefer_const_constructors
  runApp(ProviderScope(child: MyApp()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const RootPage(),
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    LearnPage(),
    TestPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn flutter'),
      ),
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.book_online), label: 'Learn'),
          NavigationDestination(
              icon: Icon(Icons.textsms_outlined), label: 'Test'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
