import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/blocs/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloC bloc = new LoginBloC();

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
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
              const Text('Welcome back, you\'ve been missed',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 50,
              ),

              //email textfield
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: StreamBuilder(
                          stream: bloc.usernameStream,
                          builder: (context, snapshot) => TextField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                    errorText:
                                        '${snapshot.hasError ? snapshot.error : null}',
                                    border: InputBorder.none,
                                    hintText: 'Email'),
                              ))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //password textfield
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: StreamBuilder(
                          stream: bloc.passwordStream,
                          builder: (context, snapshot) => TextField(
                                controller: _passwordController,
                                // obscureText: true,
                                decoration: InputDecoration(
                                  errorText: snapshot.hasError
                                      ? snapshot.error.toString()
                                      : null,
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                ),
                              ))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //sign in button
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Container(
              //     padding: const EdgeInsets.all(20.0),
              //     decoration: BoxDecoration(
              //         color: Colors.deepOrangeAccent,
              //         borderRadius: BorderRadius.circular(10)),
              //     child: const Center(
              //         child: Text(
              //       'Sign in',
              //       style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white,
              //           fontSize: 15),
              //     )),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton(
                    onPressed: () => {onSignInClicked()},
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
    );
  }

  void onSignInClicked() {
    if (bloc.isValidInfo(_usernameController.text, _passwordController.text)) {
      print("Login successfully");
    }
  }
}
