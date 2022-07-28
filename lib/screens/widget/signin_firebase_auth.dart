import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/screens/widget/register_firebase_auth.dart';

class SingInFirebaseAuth extends StatefulWidget {
  const SingInFirebaseAuth({Key? key}) : super(key: key);

  @override
  State<SingInFirebaseAuth> createState() => _SingInFirebaseAuthState();
}

class _SingInFirebaseAuthState extends State<SingInFirebaseAuth> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // hello again!
              Text(
                'Hello again!',
                style: GoogleFonts.bebasNeue(fontSize: 52),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Sign In Firebase Authentication',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 50,
              ),

              //email textfield
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
                          controller: emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Email'),
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton(
                    onPressed: () => {signIn()},
                    child: const SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Center(
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
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      text: 'No account? ',
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return RegisterFirebaseAuth();
                            }));
                          },
                        text: 'Sign up',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondary))
                  ]))
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => const Center(
    //           child: CircularProgressIndicator(),
    //         ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on Exception catch (e) {
      print(e);
    }

    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
