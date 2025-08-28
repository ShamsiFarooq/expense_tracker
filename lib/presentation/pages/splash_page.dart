// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:foxus/app/router/app_router.dart';
import 'package:foxus/app/router/route_names.dart';
import 'package:foxus/app/theme/app_spacing.dart';
import 'package:foxus/app/theme/app_typography.dart';
import 'package:go_router/go_router.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // tiny delay to simulate boot, then route based on stub auth
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 400));
      if (authState.isAuthenticated) {
        // ignore: use_build_context_synchronously
        context.goNamed(AppRoute.dashboard.name);
      } else {
        context.goNamed(AppRoute.login.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Text('Foxus • Splash', style: AppTypography.headlineMedium),
        ),
      ),
    );
  }
}
