enum AppRoute {
  splash,
  login,
  dashboard,
  expenses,
  addExpense,
  income,
  settings,
}

extension AppRouteName on AppRoute {
  String get name => switch (this) {
        AppRoute.splash => 'splash',
        AppRoute.login => 'login',
        AppRoute.dashboard => 'dashboard',
        AppRoute.expenses => 'expenses',
        AppRoute.addExpense => 'add_expense',
        AppRoute.income => 'income',
        AppRoute.settings => 'settings',
      };

  /// Canonical paths (lock this structure)
  String get path => switch (this) {
        AppRoute.splash => '/splash',
        AppRoute.login => '/login',
        AppRoute.dashboard => '/dashboard',
        AppRoute.expenses => '/expenses',
        AppRoute.addExpense => '/expenses/add',
        AppRoute.income => '/income',
        AppRoute.settings => '/settings',
      };
}
