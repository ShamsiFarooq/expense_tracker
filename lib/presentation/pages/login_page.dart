import 'package:flutter/material.dart';
import 'package:foxus/app/theme/app_typography.dart';
import 'package:foxus/app/theme/app_spacing.dart';
import 'package:foxus/app/router/app_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Page (stub)', style: AppTypography.headlineMedium),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () {
                // stub “login”
                authState.signIn();
                goToDashboard(context);
              },
              child: const Text('Continue → Dashboard'),
            ),
          ],
        ),
      
    );
  }
}
