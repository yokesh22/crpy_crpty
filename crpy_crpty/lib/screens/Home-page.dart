import 'package:crpy_crpty/constants.dart';
import 'package:crpy_crpty/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/sharedPref.dart';
import 'Search-Page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary_color,
        title: Text("Crpy-Crpty"),
        centerTitle: true,
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem(child: Text("New group")),
              const PopupMenuItem(child: Text("New broadcast")),
              const PopupMenuItem(child: Text("Linked devices")),
              const PopupMenuItem(child: Text("Starred messages")),
              const PopupMenuItem(child: Text("Payments")),
              const PopupMenuItem(child: Text("Settings")),
              PopupMenuItem(
                  child: GestureDetector(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        await SharedPreferenceFunctions.signOut();
                        setState(() {
                          SharedPreferenceFunctions.userLoggedIn(false);
                        });
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()),
                            (route) => false);
                      },
                      child: Text("Logout"))),
            ];
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary_color,
        // isExtended: false,
        child: Icon(
          Icons.search_rounded,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SearchScreen()));
        },
      ),
    );
  }
}
