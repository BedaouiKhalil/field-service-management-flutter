import 'package:flutter/material.dart';
import 'package:fsm_mobile/presentation/controllers/auth_controller.dart';
import 'package:get/get.dart';

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
        controller: passwordController,
        validator: valid,
        keyboardType: TextInputType.text,
        obscureText: !controller.isPasswordVisible.value,
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: controller.togglePasswordVisibility,
            icon: Icon(
              controller.isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
          ),
        ),
      ),
    );
  }
}