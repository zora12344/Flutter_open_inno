import 'package:flutter/material.dart';
import './profile_page.dart';
import '../navbar/navbar.dart'; // Importez NavBar
import './camera_page.dart';

// Classe pour les informations des vaches
class Cow {
  final String id;
  final int age;
  final DateTime birthDate;

  Cow({required this.id, required this.age, required this.birthDate});
}

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
        Navigator.pushReplacementNamed(context, 'camera');
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
    // Exemples de données des vaches
    final List<Cow> cows = [
      Cow(id: '001', age: 5, birthDate: DateTime(2019, 3, 15)),
      Cow(id: '002', age: 3, birthDate: DateTime(2021, 7, 12)),
      Cow(id: '003', age: 4, birthDate: DateTime(2020, 5, 20)),
      Cow(id: '001', age: 5, birthDate: DateTime(2019, 3, 10)),
      Cow(id: '002', age: 3, birthDate: DateTime(2021, 7, 11)),
      Cow(id: '003', age: 4, birthDate: DateTime(2020, 5, 20)),
      // Ajoutez plus de données de vaches ici
    ];

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
                      'Informations du troupeau',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('Âge')),
                          DataColumn(label: Text('Date de naissance')),
                        ],
                        rows: cows.map((cow) {
                          return DataRow(cells: [
                            DataCell(Text(cow.id)),
                            DataCell(Text(cow.age.toString())),
                            DataCell(Text('${cow.birthDate.day}/${cow.birthDate.month}/${cow.birthDate.year}')),
                          ]);
                        }).toList(),
                      ),
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
