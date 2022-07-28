import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterFirebaseAuth extends StatefulWidget {
  const RegisterFirebaseAuth({Key? key}) : super(key: key);

  @override
  State<RegisterFirebaseAuth> createState() => _RegisterFirebaseAuthState();
}

class _RegisterFirebaseAuthState extends State<RegisterFirebaseAuth> {
  final emailController = TextEditingController();
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
                  'Create new account with Firebase Auth',
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
                              {signUp()}
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
                            'Sign up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on Exception catch (e) {
      print(e);
    }
  }
}
