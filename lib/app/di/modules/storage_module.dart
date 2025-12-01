import 'package:hive_flutter/hive_flutter.dart';

/// Storage module: Hive initialization and box registration.
/// Exports: initStorageModule() to initialize Hive and register adapters.
/// Box names: expenses_box, income_box (to be used in Phase 1).

const String expensesBoxName = 'expenses_box';
const String incomeBoxName = 'income_box';

Future<void> initStorageModule() async {
  // Initialize Hive for Flutter
  await Hive.initFlutter();

  // Register adapters will be added in Phase 1 when ExpenseModel and IncomeModel are created
  // Example:
  // Hive.registerAdapter(ExpenseModelAdapter());

  // Open boxes (create if not exists)
  await Hive.openBox(expensesBoxName);
  await Hive.openBox(incomeBoxName);
}
