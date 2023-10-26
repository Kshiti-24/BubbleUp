import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Book Now',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Book Now',
          ),
        ],
      ),
    );
  }
}
