import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppColors {
  static Color mainColor = Color(0XFF252331);
  static Color darkColor = Colors.white;
  static Color blueColor = Color(0XFF2c75fd);
}

void showSnackbar(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
    ),
  );
}

const bold = TextStyle(fontWeight: FontWeight.bold);
const link = TextStyle(color: Color(0xFF3F729B));