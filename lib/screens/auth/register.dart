import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/models/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // hello again!
                Text(
                  'Create new account',
                  style: GoogleFonts.bebasNeue(fontSize: 52),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Welcome to your app',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 50,
                ),

                //fullname textfield
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
                            controller: fullnameController,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: 'Fullname'),
                          ))),
                ),
                const SizedBox(
                  height: 10,
                ),

                //email textfield
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
                            controller: emailController,
                            // obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                            ),
                          ))),
                ),

                const SizedBox(
                  height: 10,
                ),

                //address textfield
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
                              hintText: 'Address',
                            ),
                          ))),
                ),
                const SizedBox(
                  height: 10,
                ),

                //password textfield
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
                            controller: passwordController,
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

                //confirmpassword textfield
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
                            controller: confirmPasswordController,
                            // obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confrim Password',
                            ),
                          ))),
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                      onPressed: () => {
                            if (passwordController.text ==
                                confirmPasswordController.text)
                              {
                                register(
                                    fullname: fullnameController.text,
                                    email: emailController.text,
                                    address: addressController.text,
                                    password: passwordController.text)
                              }
                            else
                              {
                                print(
                                    'Password and confirm password are not match!'),
                              }
                          },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),

                // not a member register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('Register Now',
                        style: TextStyle(
                          color: Colors.blue[400],
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future register(
      {required String fullname,
      required String email,
      required String address,
      required String password}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final user = User(
      id: docUser.id,
      fullname: fullname,
      email: email,
      address: address,
      password: password,
    );

    final json = user.toJson();
    await docUser.set(json);
  }
}
