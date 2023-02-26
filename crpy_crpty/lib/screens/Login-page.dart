import 'package:crpy_crpty/screens/Home-page.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../modals/countrymodel.dart';
import '../services/auth.dart';
import '../services/database.dart';
import '../services/sharedPref.dart';
import 'countrycodes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthMethods authMethods = AuthMethods();
  DatabaseConnection database = DatabaseConnection();
  SharedPreferenceFunctions sharedPref = SharedPreferenceFunctions();

  TextEditingController phone_controller = TextEditingController();
  TextEditingController OTP_controller = TextEditingController();
  String code = "+91";
  String name = "India";
  bool showOTP = false;
  bool alertshow = true;

  void setCountryData(CountryModel country) {
    setState(() {
      code = country.code;
      name = country.name;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kLoginBG,
      body: SafeArea(
          child: Container(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 66),
                    child: Text(
                      "Verify your phone number",
                      style: TextStyle(
                        color: heading_color,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10, left: 23),
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              "Crypty will send an sms message to verify your number",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            // const Text(
            //   "whats my number?",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(color: Colors.cyan, fontSize: 13),
            // ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CountryCode(
                      setCountryData: setCountryData,
                    ),
                  ),
                );
              },
              child: countrycard(),
            ),
            countrycode(),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: showOTP,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 10 - 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: primary_color, width: 2),
                  ),
                ),
                child: TextFormField(
                  controller: OTP_controller,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: primary_color),
                  decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                      hintText: "Enter OTP",
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
            ),
            Container(
              width: 100,
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primary_color),
                ),
                // onPressed: () {},
                onPressed: () async {
                  if (showOTP) {
                    // Map usermap() {
                    //   return {'phone': phone_controller};
                    // }

                    SharedPreferenceFunctions.saveUserPhone(
                        code + phone_controller.text);

                    authMethods
                        .verifyOTP(otp: OTP_controller.text)
                        .then((val) async {
                      print("logged in");

                      await SharedPreferenceFunctions.userLoggedIn(true);
                      await database.saveUser(code + phone_controller.text);

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const HomePageScreen()),
                          (route) => false);
                    });
                  } else {
                    authMethods.phoneno_verification(phone_controller.text);
                    showOTP = true;
                    setState(() {});
                  }
                },
                child: const Text("NEXT"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Carrier SMS charges may apply",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13.0),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            //   child: Text(
            //     "If you want to restore chats history from Crypty,make sure you made a backup from your messages,then you can restore it by pressing the button below,then put your number-press on {Verify}",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontSize: 16,
            //     ),
            //   ),
            // ),
            Expanded(child: Container()),
            // Container(
            //   padding: EdgeInsets.only(bottom: 20),
            //   height: 70,
            //   width: MediaQuery.of(context).size.width / 2 + 50,
            //   child: ElevatedButton(
            //     style: ButtonStyle(
            //       backgroundColor: MaterialStateProperty.all(
            //           Color.fromARGB(255, 36, 26, 61)),
            //     ),
            //     onPressed: () {},
            //     child: const Text("COPY CRYPTY DATA"),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // )
          ],
        ),
      )),
    );
  }

  Widget countrycode() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 10 - 40,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 4.9,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: primary_color, width: 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "+",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  code.substring(1),
                  style: TextStyle(fontSize: 16, color: primary_color),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2.46,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: primary_color, width: 2),
              ),
            ),
            child: TextFormField(
              controller: phone_controller,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 16,
                color: primary_color,
              ),
              decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  hintText: "Phone number",
                  hintStyle: TextStyle(color: primary_color)),
            ),
          ),
        ],
      ),
    );
  }

  Widget countrycard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: primary_color, width: 2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                name,
                style: TextStyle(color: primary_color, fontSize: 17),
              ),
            ),
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
