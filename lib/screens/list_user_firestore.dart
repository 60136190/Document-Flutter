import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled2/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class ListUserFirestorePage extends StatefulWidget {
  const ListUserFirestorePage({Key? key}) : super(key: key);

  @override
  State<ListUserFirestorePage> createState() => _ListUserFirestorePageState();
}

class _ListUserFirestorePageState extends State<ListUserFirestorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            children: [
              Text(
                'List user',
                style: GoogleFonts.bebasNeue(fontSize: 52),
              ),
              Expanded(
                child: StreamBuilder<List<User>>(
                  stream: readUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something is wrong...');
                    } else if (snapshot.hasData) {
                      final users = snapshot.data!;
                      return ListView(
                        children: users.map(buildUser).toList(),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.red[200],
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }

  Widget buildUser(User user) => InkWell(
        onTap: () {
          updateUser(user);
        },
        child: Row(
          children: [
            CircleAvatar(
                child: Text(
              user.address,
              style: const TextStyle(fontSize: 10),
            )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.fullname,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(user.email),
                ],
              ),
            ),
            Expanded(
                child: InkWell(
                    onDoubleTap: () {
                      deleteUser(user);
                    },
                    child: const Icon(Icons.edit_off_outlined))),
          ],
        ),
      );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future updateUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);
    await docUser.update({'fullname': 'Thai Binh'});
  }

  Future deleteUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);
    await docUser.delete();
  }
}
