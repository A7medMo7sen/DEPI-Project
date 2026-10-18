import 'package:flutter/material.dart';
import 'package:quiz_app/Pages/quiz_page.dart';
import 'package:quiz_app/Pages/splash_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Pages/review_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, // your current call
    );
  } on FirebaseException catch (e) {
    if (e.code != 'duplicate-app') rethrow;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizUp',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F5FF),
        colorSchemeSeed: const Color(0xFF6255E7),
      ),
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}
