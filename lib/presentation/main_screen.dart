import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/bottom_navigation_widget.dart';
import 'package:flutter_task/presentation/devices_screen.dart';
import 'package:flutter_task/presentation/home_screen.dart';
import 'package:flutter_task/presentation/library_screen.dart';
import 'package:flutter_task/presentation/music_screen.dart';
import 'package:flutter_task/presentation/profile_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    LibraryScreen(),
    DevicesScreen(),
    MusicScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
