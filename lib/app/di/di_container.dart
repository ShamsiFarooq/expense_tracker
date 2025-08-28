import 'package:get_it/get_it.dart';

import 'package:foxus/app/di/modules/auth_module.dart';
import 'package:foxus/app/di/modules/expense_module.dart';
import 'package:foxus/app/di/modules/income_module.dart';

/// Global service locator
final sl = GetIt.instance;

/// Central place to init all dependencies
Future<void> initDependencies() async {
  // Feature modules
  await initAuthModule();
  await initExpenseModule();
  await initIncomeModule();

  // TODO: register Firebase services
  // TODO: register Hive/local storage
  // TODO: register network clients (Dio, http, etc.)
  // TODO: register analytics/crashlytics
}
