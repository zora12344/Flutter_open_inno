import 'package:flutter/material.dart';
import './signin_page.dart'; // Importez la page de connexion
import './profile_page.dart';

class LoginPageArgument {
  final String routeNameNext;

  LoginPageArgument(this.routeNameNext);
}

class LoginPage extends StatefulWidget {
  static String routeName = 'login';
  final String routeNameNext;

  const LoginPage(this.routeNameNext, {Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _username;
  late String _password;
  late String _errorMessage = 'erreur';

  void _login() {
    // Vérifier les informations d'identification de l'utilisateur ici
    // Par exemple, vérifiez simplement que le nom d'utilisateur et le mot de passe ne sont pas vides
    if (_username.isNotEmpty && _password.isNotEmpty) {
      // Vérifiez si les informations d'identification sont valides
      if (_username == 'utilisateur' && _password == 'motdepasse') {
        // Si les informations d'identification sont valides, définissez l'utilisateur fictif avec des données
        User user = User (
          firstName: 'John',
          lastName: 'Doe',
          email: 'john.doe@example.com',
          phone: '1234567890',
          address: '123 Main St',
        );
        // Naviguer vers la page de profil en utilisant le widget Navigator
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage(user: user)),
        );
      } else {
        // Si les informations d'identification sont incorrectes, affichez un message d'erreur
        setState(() {
          _errorMessage = 'Nom d\'utilisateur ou mot de passe incorrect';
        });
      }
    } else {
      // Si les champs sont vides, affichez un message d'erreur
      setState(() {
        _errorMessage = 'Veuillez saisir un nom d\'utilisateur et un mot de passe';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_plant.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Card(
                color: Color.fromRGBO(245, 245, 245, 0.80),
                margin: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Identifiant',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) => _username = value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                            filled: true,
                            fillColor: Color(0xFFD9D4D4),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      const Text(
                        'Mot de passe',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) => _password = value,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            filled: true,
                            fillColor: Color(0xFFD9D4D4),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _login,
                        child: Text('Se connecter'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF91BE70),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignInPage()),
                          );
                        },
                        child: const Text(
                          "Vous n'avez pas un compte ? Créer un compte",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}