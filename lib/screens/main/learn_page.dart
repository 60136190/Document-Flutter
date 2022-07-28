import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network('https://i.imgur.com/EhP15tm.jpg'),
          Image.network('https://i.imgur.com/EhP15tm.jpg'),
          Image.network('https://i.imgur.com/EhP15tm.jpg'),
          Image.network('https://i.imgur.com/EhP15tm.jpg'),
          Image.network('https://i.imgur.com/EhP15tm.jpg'),
        ],
      ),
    );
  }
}
