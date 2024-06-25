import 'package:flutter/material.dart';
import '../navbar/navbar.dart'; // Importez NavBar
import './camera_page.dart';

// Classe pour les informations des vaches
class Cow {
  final String id;
  final int age;
  final DateTime birthDate;

  Cow({required this.id, required this.age, required this.birthDate});
}

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  final List<Cow> cows = [
    Cow(id: '001', age: 5, birthDate: DateTime(2019, 3, 15)),
    Cow(id: '002', age: 3, birthDate: DateTime(2021, 7, 12)),
    Cow(id: '003', age: 4, birthDate: DateTime(2020, 5, 20)),
    Cow(id: '001', age: 5, birthDate: DateTime(2019, 3, 10)),
    Cow(id: '002', age: 3, birthDate: DateTime(2021, 7, 11)),
    Cow(id: '003', age: 4, birthDate: DateTime(2020, 5, 20)),
    // Ajoutez plus de données de vaches ici
  ];

  List<Cow> filteredCows = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCows = cows; // Au début, affichez toutes les vaches
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCows(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        filteredCows = cows; // Afficher toutes les vaches si la recherche est vide
      } else {
        filteredCows = cows.where((cow) => cow.id.toLowerCase().contains(searchText.toLowerCase())).toList();
      }
    });
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations de vache'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Container(
              width: 300.0, // Largeur fixe pour le champ de recherche
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.green.withOpacity(0.3),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterCows,
                decoration: InputDecoration(
                  hintText: 'Rechercher une vache par ID',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.green),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_plant.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20.0), // Marge supérieure pour le titre
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
                          const Text(
                            'La Vache',
                            style: TextStyle(
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
                              rows: filteredCows.map((cow) {
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
          ),
        ],
      ),
    );
  }
}
