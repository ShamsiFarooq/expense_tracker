import 'package:flutter/material.dart';
import 'package:foxus/app/theme/app_typography.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Income')),
      body:  const Text('Income (stub)', style: AppTypography.bodyLarge),
     
    );
  }
}
