import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled2/screens/widget/home_page_firebase_auth.dart';
import 'package:untitled2/screens/widget/signin_firebase_auth.dart';

class FirebaseAuthPage extends StatelessWidget {
  const FirebaseAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong1'),
            );
          } else if (snapshot.hasData) {
            return HomePageFirebaseAuth();
          } else {
            return SingInFirebaseAuth();
          }
        },
      ),
    );
  }
}
