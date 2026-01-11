import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataWidget extends StatelessWidget {
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;
  final Widget child;
  final VoidCallback? onRetry;

  const HandlingDataWidget({
    Key? key,
    required this.isLoading,
    required this.hasError,
    this.errorMessage,
    required this.child,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildLoadingState();
    }

    if (hasError) {
      return _buildErrorState(context);
    }

    return child;
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/loading.json', width: 200, height: 200),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/error.json',
              width: 200,
              height: 200,
              repeat: false,
            ),
            const SizedBox(height: 20),

            Text(
              errorMessage ?? 'An error occurred',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            if (onRetry != null) ...[
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
