import 'package:flutter/material.dart';
import 'package:foxus/presentation/pages/add_expense_page.dart';
import 'package:foxus/presentation/pages/dashboard_page.dart';
import 'package:foxus/presentation/pages/expense_list_page.dart';
import 'package:foxus/presentation/pages/income_page.dart';
import 'package:foxus/presentation/pages/login_page.dart';
import 'package:foxus/presentation/pages/settings_page.dart';
import 'package:foxus/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

import 'package:foxus/app/router/route_names.dart';

/// ------------------------------------------------------------
/// Stub auth state (Issue 3: routing proof only)
/// ------------------------------------------------------------
class AuthState extends ChangeNotifier {
  bool _isAuthenticated = false; // start unauthenticated

  bool get isAuthenticated => _isAuthenticated;

  void signIn() {
    _isAuthenticated = true;
    notifyListeners(); // triggers router redirect reevaluation
  }

  void signOut() {
    _isAuthenticated = false;
    notifyListeners();
  }
}

// A single global instance is fine until DI is added in Issue 4.
final AuthState authState = AuthState();

/// ------------------------------------------------------------
/// Router (single instance for the whole app)
/// ------------------------------------------------------------
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createAppRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoute.splash.path,
    // Re-run redirects when auth changes
    refreshListenable: authState,

    // 🔐 Global guard (simple, fast, side-effect free)
    redirect: (context, state) {
      final String path = state.uri.path;

      // Public routes
      final bool isSplash = path == AppRoute.splash.path;
      final bool isLogin = path == AppRoute.login.path;

      // Protected routes (everything except splash/login)
      final bool isProtected = !isSplash && !isLogin;

      // If unauth → only allow splash/login
      if (!authState.isAuthenticated && isProtected) {
        return AppRoute.login.path;
      }

      // If auth and on /login → send to dashboard
      if (authState.isAuthenticated && isLogin) {
        return AppRoute.dashboard.path;
      }

      // No redirect
      return null;
    },

    // Routes
    routes: <RouteBase>[
      GoRoute(
        name: AppRoute.splash.name,
        path: AppRoute.splash.path,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: AppRoute.login.name,
        path: AppRoute.login.path,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: AppRoute.dashboard.name,
        path: AppRoute.dashboard.path,
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        name: AppRoute.expenses.name,
        path: AppRoute.expenses.path,
        builder: (context, state) => const ExpenseListPage(),
      ),
      GoRoute(
        name: AppRoute.addExpense.name,
        path: AppRoute.addExpense.path,
        builder: (context, state) => const AddExpensePage(),
      ),
      GoRoute(
        name: AppRoute.income.name,
        path: AppRoute.income.path,
        builder: (context, state) => const IncomePage(),
      ),
      GoRoute(
        name: AppRoute.settings.name,
        path: AppRoute.settings.path,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}

/// ------------------------------------------------------------
/// Navigation helpers (keeps calls consistent throughout the app)
/// ------------------------------------------------------------
void goToDashboard(BuildContext context) =>
    context.goNamed(AppRoute.dashboard.name);

void goToLogin(BuildContext context) => context.goNamed(AppRoute.login.name);

void goToExpenses(BuildContext context) =>
    context.goNamed(AppRoute.expenses.name);

void goToAddExpense(BuildContext context) =>
    context.pushNamed(AppRoute.addExpense.name);

void goToIncome(BuildContext context) => context.goNamed(AppRoute.income.name);

void goToSettings(BuildContext context) =>
    context.goNamed(AppRoute.settings.name);
