import 'package:flutter/material.dart';

class AuthEmailField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) valid;

  const AuthEmailField({
    super.key,
    required this.controller,
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: valid,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }
}
