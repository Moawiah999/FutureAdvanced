import 'package:apptesttest/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    String? email;
    String? pass;

    return Scaffold(
      appBar: AppBar(
        title: Text("Log in "),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              child: Image.asset("assets/images/future.jpg"),
            ),
            TextField(
              onChanged: (data) {
                email = data;
              },
              decoration: InputDecoration(hintText: "Enter email"),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              onChanged: (data) {
                pass = data;
              },
              decoration: InputDecoration(hintText: "enter pas"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  var auth = FirebaseAuth.instance;
                  UserCredential user = await auth.signInWithEmailAndPassword(
                      email: email!, password: pass!);
                  print(user.user!.displayName);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                } on Exception catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("sorry there is an error $e")));
                }
              },
              child: Text("log in "),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return RegistrationScreen();
                  },
                ));
              },
              child: Text(
                "If you do not have an account, register",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
