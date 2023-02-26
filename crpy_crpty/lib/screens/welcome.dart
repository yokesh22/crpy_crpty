import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants.dart';
import 'Login-page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 65, bottom: 20),
              child: Text(
                "Welcome to Crpy-Crpty",
                style: TextStyle(
                    color: heading_color,
                    fontSize: 27.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 35, left: 20, right: 20, bottom: 38),
              child: Image.asset(
                "assets/images/welcome.png",
              ),
            ),
            // SizedBox(
            //   height: 30,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Agree and Continue to accept the ",
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    TextSpan(
                      text: "Crypty Terms of Service and Privacy Policy",
                      style: TextStyle(fontSize: 17, color: Colors.cyan),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width / 2 + 70,
              height: size.height / 10 - 30,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primary_color),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
                },
                child: Text("AGREE AND CONTINUE"),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "from",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "CRYPTY",
                    style: TextStyle(
                      letterSpacing: 3.5,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: primary_color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
