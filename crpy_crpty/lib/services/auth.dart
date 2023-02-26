import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var verificationIdReceived;
  bool visibility = false;

  phoneno_verification(phoneno) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: "+91" + phoneno,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationIdReceived = verificationId;
        visibility = true;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return visibility;
  }

  verifyOTP({otp}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationIdReceived,
      smsCode: otp,
    );
    _firebaseAuth.signInWithCredential(credential);
  }
}
