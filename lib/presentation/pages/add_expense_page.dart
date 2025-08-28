import 'package:flutter/material.dart';
import 'package:foxus/app/theme/app_typography.dart';

class AddExpensePage extends StatelessWidget {
  const AddExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body:  const Text('Add Expense (stub)', style: AppTypography.bodyLarge),
      
    );
  }
}
