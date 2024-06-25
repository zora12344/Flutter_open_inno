import 'package:flutter/material.dart';
import './views/login_page.dart'; // Importez la page de connexion
import './views/profile_page.dart'; // Importez la page de profil
import './views/signin_page.dart'; // Importez la page d'inscription
import './views/description_page.dart'; // Importez la page de description
import './views/camera_page.dart';


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
      routes: {
        'description': (context) =>  DescriptionPage(),
        'camera': (context) =>  CameraPage(),
        'login': (context) => const LoginPage('home'),
        'profile': (context) => ProfilePage(user: User(
          firstName: 'John',
          lastName: 'Doe',
          email: 'john.doe@example.com',
          phone: '1234567890',
          address: '123 Main St',
        )),
        'signin': (context) => const SignInPage(),
      },
    );
  }
}
