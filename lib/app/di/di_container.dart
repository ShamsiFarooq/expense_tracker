import 'package:get_it/get_it.dart';

import 'package:foxus/app/di/modules/auth_module.dart';
import 'package:foxus/app/di/modules/expense_module.dart';
import 'package:foxus/app/di/modules/income_module.dart';
import 'package:foxus/app/di/modules/storage_module.dart';

/// Global service locator
final sl = GetIt.instance;

/// Central place to init all dependencies
Future<void> initDependencies() async {
  // Storage (must be initialized first)
  await initStorageModule();

  // Feature modules
  await initAuthModule();
  await initExpenseModule();
  await initIncomeModule();

  // TODO: register Firebase services (Phase 3)
  // TODO: register network clients (Dio, http, etc.) (Phase 3)
  // TODO: register analytics/crashlytics (Phase 4)
}
