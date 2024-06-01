import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(int) onItemSelected;

  const NavBar({Key? key, required this.onItemSelected}) : super(key: key);

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
            icon: const Icon(Icons.map, color: Colors.white), // Icône MAP
            onPressed: () => onItemSelected(1),
          ),
          IconButton(
            icon: const Icon(Icons.post_add, color: Colors.white), // Icône POST
            onPressed: () => onItemSelected(2),
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white), // Icône PROFILE
            onPressed: () => onItemSelected(3),
          ),
        ],
      ),
    );
  }
}
