import 'package:flutter/material.dart';
import 'package:fsm_mobile/core/constants/app_routes.dart';
import 'package:fsm_mobile/presentation/controllers/auth_controller.dart';
import 'package:fsm_mobile/presentation/widgets/auth/auth_email_field.dart';
import 'package:fsm_mobile/presentation/widgets/auth/auth_password_field.dart';
import 'package:fsm_mobile/presentation/widgets/common/handling_data_widget.dart';
import 'package:fsm_mobile/presentation/widgets/common/primary_button.dart';
import 'package:fsm_mobile/utils/exit_app.dart';
import 'package:fsm_mobile/utils/validators.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  LoginScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _handleLogin() async {
    if (Get.context != null) {
      final success = await controller.login();

      if (success) {
        _handleSuccessNavigation();
      } else {
        _handleErrorFeedback();
      }
    }
  }

  void _handleSuccessNavigation() {
    Get.offAllNamed(AppRoutes.tasks);
  }

  void _handleErrorFeedback() {
    final context = _scaffoldKey.currentContext;

    if (context != null) {
      final theme = Theme.of(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(controller.errorMessage.value),
          backgroundColor: theme.colorScheme.error,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(15),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final shouldExit = await alertExitApp();

        if (shouldExit && context.mounted) {
          Get.back();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: const Text('Welcome back')),
        body: Obx(
          () => HandlingDataWidget(
            isLoading: controller.isLoading.value,
            hasError: false,
            errorMessage: controller.errorMessage.value,
            child: _buildLoginForm(context),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: controller.formstate,
        child: ListView(
          children: [
            const SizedBox(height: 35),

            Text(
              'Sign in to continue',
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: theme.colorScheme.primary,
              ),
            ),

            const SizedBox(height: 25),

            AuthEmailField(
              controller: controller.email,
              valid: (val) =>
                  Validators.validateInput(value: val!, type: 'email'),
            ),

            const SizedBox(height: 15),

            AuthPasswordField(
              passwordController: controller.password,
              valid: (val) =>
                  Validators.validateInput(value: val!, type: 'password'),
            ),

            const SizedBox(height: 35),

            PrimaryButton(text: "Login", onPressed: _handleLogin),
          ],
        ),
      ),
    );
  }
}
