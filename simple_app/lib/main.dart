import 'package:flutter/material.dart';

import 'pages/login_page.dart';

void main() {
  runApp(const MeeBilaApp());
}

class MeeBilaApp extends StatelessWidget {
  const MeeBilaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mee Bila',
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const LoginPage(),
    );
  }
}
