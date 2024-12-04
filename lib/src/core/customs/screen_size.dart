import 'package:flutter/material.dart';

class ScreenSize {
  static late double height;
  static late double width;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
  }
}