import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(int) onItemSelected;
  final int? currentIndex; // Ajout du currentIndex comme paramètre optionnel

  const NavBar({Key? key, required this.onItemSelected, this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white), // Icône HOME
            onPressed: () => onItemSelected(0),
          ),
          IconButton(
            icon: const Icon(Icons.watch, color: Colors.white), // Icône WATCH
            onPressed: () => onItemSelected(1),
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.white), // Icône CAMERA
            onPressed: () => onItemSelected(2),
          ),
          IconButton(
            icon: const Icon(Icons.info, color: Colors.white), // Icône INFO
            onPressed: () => onItemSelected(3),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white), // Icône ACCOUNT
            onPressed: () => onItemSelected(4),
          ),
        ],
      ),
    );
  }
}
