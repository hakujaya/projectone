import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_ras/app/dashboard/dashboard.dart';
import 'package:project_ras/app/sign_in/email_signIn.dart';
import 'package:project_ras/app/sign_in/sign_in_button.dart';
import 'package:project_ras/services/Auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;
  static const hijau = Color(0xFF5CD297);
  static const biru = Color(0xFF3CACDE);

  Future<void> _signInAnynomously() async {
    final userCredentials = await FirebaseAuth.instance.signInAnonymously();
    print('${userCredentials.user.uid}');
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (context) => EmailLogin(
        auth: auth,
      ),
    ));
  }

  void _goToDashboard(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (context) => Dashboard(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildContent(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    print(sizeWidth / 15);
    print(sizeHeight);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image(height: 100.0, image: AssetImage('images/logo_risda.png')),
          SizedBox(height: 48.0),
          Text(
            'RISDA Accounting System',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: sizeWidth * 1 / 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 48.0),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SignInButton(
                  text: 'Log Masuk',
                  textColor: Colors.white,
                  color: hijau,
                  onPressed: () => _signInWithEmail(context),
                ),
                SizedBox(height: 8.0),
                Text(
                  'atau',
                  style: TextStyle(fontSize: 14.0, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                SignInButton(
                  text: 'Daftar Akaun Baru',
                  textColor: Colors.white,
                  color: biru,
                  onPressed: () => _goToDashboard(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
