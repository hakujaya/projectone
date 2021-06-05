import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_ras/app/sign_in/sign_in_page.dart';
import 'package:project_ras/services/Auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({@required this.auth});
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SignInPage(auth: Auth()),

      // LandingPage(
      //   auth: Auth(),
      // ),
    );
  }
}
