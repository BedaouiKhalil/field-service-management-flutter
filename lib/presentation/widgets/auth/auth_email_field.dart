import 'package:flutter/material.dart';
import 'package:fsm_mobile/core/constants/app_colors.dart';

class AuthEmailField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) valid;

  const AuthEmailField({
    super.key,
    required this.controller, required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: const TextStyle(color: AppColors.textLightMedium),
        floatingLabelStyle: const TextStyle(color: AppColors.primary),
        hintText: "Enter your email",
        hintStyle: const TextStyle(color: AppColors.textLightMedium),
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        prefixIcon: const Icon(Icons.email, color: AppColors.primary, size: 22),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
