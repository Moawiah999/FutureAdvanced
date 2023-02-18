import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? email;
  String? pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
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
              decoration: InputDecoration(
                  hintText: "Enter The Email",
                  hintMaxLines: 1,
                  label: Text("Email")),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              onChanged: (data) {
                pass = data;
              },
              decoration: InputDecoration(
                  label: Text("Password"),
                  hintText: "Enter The Password",
                  hintMaxLines: 1),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  var auth = FirebaseAuth.instance;
                  UserCredential user =
                      await auth.createUserWithEmailAndPassword(
                          email: email!, password: pass!);
                  // print(user.user!.displayName);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("added successfully"),
                    ),
                  );
                } on Exception catch (e) {
                   ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("sorry there is an error $e")));
                }
              },
              child: Text("Registration"),
            )
          ],
        ),
      ),
    );
  }
}
