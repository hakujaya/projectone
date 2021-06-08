import 'package:flutter/material.dart';
import 'package:project_ras/services/Auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    @required this.auth,
  }) : super(key: key);
  final AuthBase auth;
  static const biru = Color(0xFF3CACDE);

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biru,
        title: Text('Home Page'),
        actions: [
          // ignore: deprecated_member_use
          FlatButton(
              onPressed: _signOut,
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.redAccent),
              ))
        ],
      ),
    );
  }
}
