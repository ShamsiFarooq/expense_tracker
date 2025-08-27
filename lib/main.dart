import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foxus/app/theme/theme.dart';
import 'package:foxus/firebase_options.dart';
import 'package:foxus/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foxus',
      theme: foxusLightTheme(),
      darkTheme: foxusDarkTheme(),
      themeMode: ThemeMode.system,
      home: const HomePage(title: 'Foxus'),
    );
  }
}
