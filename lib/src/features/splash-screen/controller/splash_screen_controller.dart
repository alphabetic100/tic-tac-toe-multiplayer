import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController {
  RxBool isLoaded = false.obs;
  Future<void> switchScreen(BuildContext context) async {
    if (isLoaded.value) {
      Future.delayed(const Duration(seconds: 2), () {
        context.goNamed("home");
      });
    }
  }
}
