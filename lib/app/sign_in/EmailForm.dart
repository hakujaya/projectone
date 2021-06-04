import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_ras/common_widgets/formsubmit_button.dart';
import 'package:project_ras/services/Auth.dart';

import 'Validator.dart';

enum EmailFormType { signIn, register }

class EmailForm extends StatefulWidget with EmailAndPasswordValidators {
  EmailForm({@required this.auth});
  final AuthBase auth;
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  EmailFormType _formType = EmailFormType.signIn;
  bool _submitted = false;
  bool _isLoading = false;

  void _submit() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    try {
      if (_formType == EmailFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _toggleFormType() {
    setState(() {
      _submitted = false;
      _formType = _formType == EmailFormType.signIn
          ? EmailFormType.register
          : EmailFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildEmailForm() {
    final primaryText =
        _formType == EmailFormType.signIn ? 'Log Masuk' : 'Daftar';
    final secondaryText = _formType == EmailFormType.signIn
        ? 'Pengguna baru? Tekan untuk Daftar'
        : 'Sudah daftar? Tekan untuk Log Masuk';

    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) &&
        !_isLoading;

    return [
      Image(
          height: 100.0,
          color: Color.fromRGBO(255, 255, 255, 1.0),
          colorBlendMode: BlendMode.modulate,
          image: AssetImage('images/logo_risda.png')),
      SizedBox(
        height: 10.0,
      ),
      Text(
        'RISDA Accounting System',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 28.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 10.0,
                color: Colors.black54,
              ),
            ]),
      ),
      SizedBox(
        height: 30.0,
      ),
      _buildEmailtextField(),
      SizedBox(
        height: 15.0,
      ),
      _buildPasswordTextField(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SizedBox(
            height: 45,
            width: 100,
            child: FormSubmitButton(
                text: primaryText, onPressed: submitEnabled ? _submit : null)),
      ),
      TextButton(
          onPressed: !_isLoading ? _toggleFormType : null,
          child: Text(
            secondaryText,
            style: TextStyle(
                color: Colors.white, decoration: TextDecoration.underline),
          ))
    ];
  }

  TextField _buildPasswordTextField() {
    bool showErrorText =
        _submitted && !widget.passwordValidator.isValid(_password);
    return TextField(
      onChanged: (password) => _updateState(),
      textInputAction: TextInputAction.done,
      controller: _passwordController,
      decoration: InputDecoration(
        errorText: showErrorText ? widget.invalidPasswordErrorText : null,
        filled: true,
        fillColor: Colors.white,
        enabled: _isLoading == false,
        prefixIcon: Icon(Icons.vpn_key),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(30.0),
          ),
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(30.0),
          ),
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }

  TextField _buildEmailtextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return TextField(
      onChanged: (email) => _updateState(),
      autocorrect: false,
      enabled: _isLoading == false,
      textInputAction: TextInputAction.next,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(30.0),
          ),
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        errorText: showErrorText ? widget.invalidEmailErrorText : null,
        prefixIcon: Icon(Icons.account_circle),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(30.0),
          ),
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(30.0),
          ),
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        labelText: 'Username',
        hintText: 'Contoh: abc@gmail.com',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildEmailForm(),
      ),
    );
  }

  _updateState() {
    setState(() {});
  }
}
