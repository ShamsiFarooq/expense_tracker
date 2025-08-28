import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foxus/app/router/app_router.dart';
import 'package:foxus/app/theme/theme.dart';
import 'package:foxus/firebase_options.dart';
import 'package:go_router/go_router.dart';

late final GoRouter _router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  _router = createAppRouter();

  runApp(const FoxusApp());
}

class FoxusApp extends StatelessWidget {
  const FoxusApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Foxus',
      theme: foxusLightTheme(),
      darkTheme: foxusDarkTheme(),
      themeMode: ThemeMode.system,
      routerConfig: _router,
    );
  }
}
