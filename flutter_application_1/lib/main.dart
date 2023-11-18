import 'package:flutter/material.dart';
import 'contraints.dart';
import 'login_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: kbackgroundcolor),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
