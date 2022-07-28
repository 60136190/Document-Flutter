import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePageFirebaseAuth extends StatelessWidget {
  const HomePageFirebaseAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(user.email!),
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ElevatedButton(
                onPressed: () => {FirebaseAuth.instance.signOut()},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'Sign out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
          ),
        ],
      )),
    ));
  }
}
