import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/auth_page.dart';
import 'contraints.dart';
import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: kbackgroundcolor),
      home: const AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
