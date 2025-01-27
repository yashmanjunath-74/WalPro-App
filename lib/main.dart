import 'package:flutter/material.dart';
import 'package:walpro/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WalPro',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        useMaterial3: true,
      ),
      home: homepage(),
    );
  }
}
