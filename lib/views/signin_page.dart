import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _email = '';
  String _address = '';
  String _telephone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_plant.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 0.80),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      const Text(
                        'Inscription',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ), // INSCRIPTION TITRE
                      SizedBox(height: 40.0),
                      const Text(
                        'Identifiant',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ), // IDENTIFIANT
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          onChanged: (value) => _username = value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Pseudo',
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
                      ), // IDENTIFIANT input
                      SizedBox(height: 16.0),
                      const Text(
                        'Téléphone',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ), // TEL
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) => _telephone = value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Numéro de Téléphone',
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
                      ), // TEL input
                      SizedBox(height: 16.0),
                      const Text(
                        'Email',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),// Email
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) => _email = value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
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
                      ),// Email input
                      SizedBox(height: 16.0),
                      const Text(
                        'Adresse',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),// ADRESSE
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) => _address = value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Adresse',
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
                      ),// ADRESSE input
                      SizedBox(height: 16.0),
                      const Text(
                        'Mot de passe',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ), //mot de passe
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) => _password = value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Mot de passe',
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
                      ),//mot de passe input
                      SizedBox(height: 16.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          child: Text('S\'inscrire'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF91BE70),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ), //bouton s'inscrire
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

  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();
      // Traitez les données d'inscription ici
      // Si l'inscription réussit, vous pouvez naviguer vers la page de connexion
      // Sinon affichez un message d'erreur
    }
  }
}
