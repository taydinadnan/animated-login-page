// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class SignInWithGoogle extends StatefulWidget {
//   @override
//   _SignInWithGoogleState createState() => _SignInWithGoogleState();
// }

// final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// _signInWithGoogle() async {
//   final GoogleSignInAccount googleUser = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//   final AuthCredential credential = GoogleAuthProvider.credential(
//       idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
// }

// class _SignInWithGoogleState extends State<SignInWithGoogle> {
//   @override
//   Widget build(BuildContext context) {
//     return _signInWithGoogle();
//   }
// }
