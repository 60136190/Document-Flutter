import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({Key? key}) : super(key: key);

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                debugPrint('Action button');
              },
              icon: const Icon(Icons.info_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset('images/auth/rua.png'),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            color: Colors.blueGrey,
            width: double.infinity,
            child: const Center(
              child: Text(
                'Learning flutter',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.blue),
            onPressed: () {
              debugPrint('Elevated Button');
            },
            child: const Text('Elevated Button'),
          ),
          OutlinedButton(
            onPressed: () {
              debugPrint('Outlined Button');
            },
            child: const Text('Outlined Button'),
          ),
          TextButton(
            onPressed: () {
              debugPrint('Text Button');
            },
            child: const Text('Text Button'),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              debugPrint('GestureDetector');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.hot_tub,
                  color: Colors.cyanAccent,
                ),
                Text('Row widget'),
                Icon(
                  Icons.face_outlined,
                  color: Colors.purple,
                ),
              ],
            ),
          ),
          Switch(
              value: isSwitch,
              onChanged: (bool newBool) {
                setState(() {
                  isSwitch = newBool;
                });
              }),
          Checkbox(
              value: isCheck,
              onChanged: (bool? newBool) {
                setState(() {
                  isCheck = newBool;
                });
              }),
          Image.network('https://i.imgur.com/EhP15tm.jpg')
        ]),
      ),
    );
  }
}
