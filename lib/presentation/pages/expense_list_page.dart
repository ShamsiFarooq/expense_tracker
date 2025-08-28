import 'package:flutter/material.dart';
import 'package:foxus/app/theme/app_typography.dart';
import 'package:foxus/app/router/app_router.dart';

class ExpenseListPage extends StatelessWidget {
  const ExpenseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
            tooltip: 'Add',
            onPressed: () => goToAddExpense(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const Text('Expense List (stub)', style: AppTypography.bodyLarge),
    );
  }
}
