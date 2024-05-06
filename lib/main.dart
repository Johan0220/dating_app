import 'package:dating_app/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
            background: Colors.blueGrey.shade50,
            onBackground: Colors.black,
            primary: const Color(0xFFFe3c72),
            onPrimary: Colors.black,
            secondary: const Color(0xFF424242),
            onSecondary: Colors.white,
            tertiary: const Color.fromRGBO(255, 204, 128, 1),
            error: Colors.red,
            outline: const Color(0xFF424242)
        ),
        useMaterial3: true,
      ),
      home: const MyScreen(),
    );
  }
}

