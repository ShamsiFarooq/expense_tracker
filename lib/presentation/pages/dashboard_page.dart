import 'package:flutter/material.dart';
import 'package:foxus/app/theme/app_typography.dart';
import 'package:foxus/app/theme/app_spacing.dart';
import 'package:foxus/app/router/app_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            tooltip: 'Settings',
            onPressed: () => goToSettings(context),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dashboard (stub)', style: AppTypography.headlineMedium),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                ElevatedButton(
                  onPressed: () => goToExpenses(context),
                  child: const Text('Expenses'),
                ),
                ElevatedButton(
                  onPressed: () => goToAddExpense(context),
                  child: const Text('Add Expense'),
                ),
                ElevatedButton(
                  onPressed: () => goToIncome(context),
                  child: const Text('Income'),
                ),
                ElevatedButton(
                  onPressed: () {
                    authState.signOut();
                    goToLogin(context);
                  },
                  child: const Text('Sign out'),
                ),
              ],
            ),
          ],
        ),
   
    );
  }
}
