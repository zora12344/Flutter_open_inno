import 'package:flutter/material.dart';
import './views/login_page.dart'; // Importez la page de connexion

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Utilisez LoginPage comme page d'accueil
      home: const LoginPage('home'),
    );
  }
}
