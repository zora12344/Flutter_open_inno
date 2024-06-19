import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import './description_page.dart';
import '../navbar/navbar.dart';

class User {
  String firstName;
  String lastName;
  String email;
  String phone;
  String address;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
  });
}

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        _image = null;
      }
    });
  }

  void _saveProfile() {
    setState(() {
      widget.user.email = _emailController.text;
      widget.user.phone = _phoneController.text;
      // Assuming password reset is handled separately
    });
  }

  void _logout() {
    Navigator.pushReplacementNamed(context, 'login'); // Navigate to login page
  }

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.user.email;
    _phoneController.text = widget.user.phone;
  }

  void _onItemSelected(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, 'description'); // Navigate to description page when home icon is clicked
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
        Navigator.pushReplacementNamed(context, 'signin');
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
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
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Choisir une photo'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Galerie'),
                                  onPressed: () {
                                    _pickImage(ImageSource.gallery);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Appareil photo'),
                                  onPressed: () {
                                    _pickImage(ImageSource.camera);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: _image != null ? FileImage(_image!) : null,
                        backgroundColor: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      '${widget.user.firstName} ${widget.user.lastName}', // Firstname & Lastname
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.mail),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.phone),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              hintText: 'Numéro de téléphone',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.lock),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              hintText: 'Nouveau mot de passe',
                              border: InputBorder.none,
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    ElevatedButton(
                      onPressed: _saveProfile,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30.0)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 10.0),
                          Text('Enregistrer'),
                        ],
                      ),
                    ),
                    const Divider(),
                    ElevatedButton(
                      onPressed: _logout,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(148, 147, 147, 0.75)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30.0)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.power_settings_new),
                          SizedBox(width: 10.0),
                          Text('Déconnexion'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Ajout du menu de navigation en bas de la page
              const SizedBox(height: 20.0),
              NavBar(onItemSelected: _onItemSelected),
            ],
          ),
        ),
      ),
    );
  }
}
