import 'package:flutter/material.dart';
import 'package:fsm_mobile/core/constants/app_colors.dart';
import 'package:fsm_mobile/presentation/controllers/auth_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AuthPasswordField extends GetView<AuthController> {
  final TextEditingController passwordController;
  final String? Function(String?) valid;

  const AuthPasswordField({
    super.key,
    required this.passwordController,
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        validator: valid,
        controller: passwordController,
        keyboardType: TextInputType.text,
        obscureText: !controller.isPasswordVisible.value,
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: TextStyle(color: AppColors.textLightMedium),
          floatingLabelStyle: TextStyle(color: AppColors.primary),
          hintText: "Enter your password",
          hintStyle: TextStyle(color: AppColors.textLightMedium),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          prefixIcon: Icon(Icons.lock, color: AppColors.primary, size: 22),
          suffixIcon: IconButton(
            onPressed: () {
              controller.togglePasswordVisibility();
            },
            icon: Icon(
              controller.isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
