import 'package:crpy_crpty/screens/Home-page.dart';
import 'package:crpy_crpty/screens/welcome.dart';
import 'package:crpy_crpty/services/sharedPref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isUserLoggedIn = false;
  getLoggedStatus() async {
    await SharedPreferenceFunctions.getUserLoggedIn().then((val) {
      setState(() {
        isUserLoggedIn = val;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoggedStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isUserLoggedIn ? HomePageScreen() : WelcomeScreen(),
    );
  }
}
