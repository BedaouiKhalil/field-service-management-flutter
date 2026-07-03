import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataWidget extends StatelessWidget {
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;
  final Widget child;
  final VoidCallback? onRetry;

  const HandlingDataWidget({
    super.key,
    required this.isLoading,
    required this.hasError,
    this.errorMessage,
    required this.child,
    this.onRetry,
  });

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
      child: Lottie.asset(
        'assets/lottie/loading.json',
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Lottie.asset(
                'assets/lottie/error.json',
                fit: BoxFit.contain,
                repeat: false,
              ),
            ),

            const SizedBox(height: 24),

            Text(
              errorMessage ?? 'An error occurred',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),

            if (onRetry != null) ...[
              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
