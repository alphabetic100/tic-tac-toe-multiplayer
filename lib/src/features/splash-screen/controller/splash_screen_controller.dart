import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe_multiplayer/src/services/local/local_storage_service.dart';

class ScreenController extends GetxController {
  final LocalStorageService storageService = LocalStorageService();

  Future<void> simulateLoading(BuildContext context) async {
    try {
      bool isLoggedIn = await storageService.isLoggedIn();
      await Future.delayed(const Duration(seconds: 3));
      if (isLoggedIn) {
        context.goNamed('home');
      } else {
        context.goNamed('welcome');
      }
    } catch (e) {
      throw Exception("something went wrong, error: $e");
    }
  }
}
