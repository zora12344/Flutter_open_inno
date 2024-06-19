import 'package:flutter/material.dart';
import './profile_page.dart';
import '../navbar/navbar.dart'; // Importez NavBar



class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  void _onItemSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, 'home'); // Navigate to home page when home icon is clicked
        break;
      case 1:
        Navigator.pushReplacementNamed(context, 'watch');
        break;
      case 2:
      // Navigate to the camera page or handle the camera functionality here
        break;
      case 3:
        Navigator.pushReplacementNamed(context, 'profile');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, 'profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description de la vache'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_plant.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 245, 245, 0.80),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/cow.jpg', // Assurez-vous que cette image existe dans votre dossier assets/images
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'La Vache',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Les vaches sont des mammifères domestiqués appartenant à l\'espèce Bos taurus. '
                          'Elles sont élevées principalement pour leur lait, leur viande et leur cuir. '
                          'Les vaches jouent également un rôle important dans l\'agriculture en tant que '
                          'animaux de trait et sources de fumier pour fertiliser les cultures.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              // Ajout du menu de navigation en bas de la page
              const SizedBox(height: 20.0),
              NavBar(
                onItemSelected: (index) => _onItemSelected(context, index),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
