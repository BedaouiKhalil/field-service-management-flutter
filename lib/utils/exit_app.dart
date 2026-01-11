import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fsm_mobile/core/constants/app_colors.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() async {
  final result = await Get.dialog<bool>(
    AlertDialog(
      title: const Text('Exit'),
      content: const Text('Do you want to exit the application?'),
      backgroundColor: AppColors.white,
      actions: [
        TextButton(
          onPressed: () => Get.back(result: false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            exit(0);
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );

  return result ?? false;
}
