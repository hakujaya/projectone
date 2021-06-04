import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_ras/common_widgets/custom_raised_button.dart';

class FormSubmitButton extends CustomRaisedButton {
  static const biru = Color(0xFF3CACDE);
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          height: 44.0,
          color: biru,
          borderRadius: 10.0,
          onPressed: onPressed,
        );
}
