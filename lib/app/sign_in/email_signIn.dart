import 'package:flutter/material.dart';
import 'package:project_ras/app/sign_in/EmailForm.dart';
import 'package:project_ras/services/Auth.dart';

class EmailLogin extends StatelessWidget {
  EmailLogin({@required this.auth});
  final AuthBase auth;
  static const color = Color(0xFF5CD297);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: EmailForm(
              auth: auth,
            ),
          ),
        ),
      ),
      backgroundColor: color,
    );
  }
}
