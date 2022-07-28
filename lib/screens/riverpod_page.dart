import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled2/models/user_riverpod.dart';
import 'package:untitled2/riverpod/test_provider.dart';
import 'package:untitled2/riverpod/user_list.dart';
import 'package:untitled2/screens/list_user_riverpod.dart';

class RiverpodPage extends ConsumerStatefulWidget {
  const RiverpodPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RiverpodPage> createState() => _RiverpodPageState();
}

class _RiverpodPageState extends ConsumerState<RiverpodPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            final name = ref.watch(profileNameProvider);
            return name.when(
              data: (name) => Text(
                name,
                style: TextStyle(color: Colors.black),
              ),
              loading: () => Text('loading...'),
              error: (e, strackTrace) => Text('Error!!'),
            );
          },
          // child: Text(
          //   'Riverpod demo',
          //   style: GoogleFonts.bebasNeue(fontSize: 30),
          // ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Thai nam",
              style: const TextStyle(color: Colors.blueGrey, fontSize: 35),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ))),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: addressController,
                        // obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ))),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final controller =
                        ref.read(UserListController.provider.notifier);
                    return Expanded(
                      child: ElevatedButton(
                          onPressed: () => {
                                controller.addUser(UserRiverpod(
                                    nameController.text,
                                    addressController.text))
                                // ref.read(UserListController.provider.notifier).addUser(UserRiverpod(nameController.text,addressController.text)),
                              },
                          child: Container(
                            height: 50,
                            width: 100,
                            child: const Center(
                              child: Text(
                                'Add user',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )),
                    );
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return UserListRiverpod();
                        }));
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        child: const Center(
                          child: Text(
                            'List user',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                ),
              ],
            ),
            Expanded(child: UserListRiverpod()),
          ],
        ),
      ),
    );
  }
}
