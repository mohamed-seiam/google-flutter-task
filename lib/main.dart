import 'package:flutter/material.dart';
import 'package:goggle_task_flutter/animation_screen/animation_screen.dart';
import 'package:goggle_task_flutter/register_screen/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes:
      {
        RegisterScreen.id : (context) => const RegisterScreen(),
        AnimationScreen.id : (context) => const AnimationScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: RegisterScreen.id,
    );
  }
}


