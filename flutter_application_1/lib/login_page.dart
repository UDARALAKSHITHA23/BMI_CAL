// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/compornents/signinbutton.dart';
import 'package:flutter_application_1/compornents/squre_tile.dart';
import 'package:flutter_application_1/compornents/text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
  });
  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signInUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Space(),
              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Welcome back you\'ve been missed !',
                style: TextStyle(
                  color: Color(0xFF455A64),
                  fontSize: 16,
                ), // 0xFF455A64 is the hexadecimal representation of Colors.grey[700]
              ),
              const SizedBox(
                height: 25,
              ),

              //email textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(
                height: 10.0,
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              //password textfield

              //forgot password
              const SizedBox(
                height: 10.0,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?'),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              //sign in button
              SignButton(
                onTap: signInUser,
              ),
              const Space(),

              //or continue with
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        ' Or Continue with ',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTitle(imageParth: 'lib/Images/google.png'),
                ],
              ),
              const Space(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a Member',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Register Now',
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // google sign in button
              const Space(),
              // not a member? register now
            ],
          ),
        ),
      ),
    );
  }
}

class Space extends StatelessWidget {
  const Space({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
    );
  }
}
