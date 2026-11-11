import 'package:flutter/material.dart';
import 'package:simple_app/pages/history_page.dart';
import 'package:simple_app/pages/home_page.dart';
import 'package:simple_app/pages/profile_page.dart';

class PowerTracker extends StatefulWidget {
  final String username;
  final String email;

  const PowerTracker({super.key, required this.username, required this.email});

  @override
  State<PowerTracker> createState() => _PowerTrackerState();
}

class _PowerTrackerState extends State<PowerTracker> {
  int selectedIndex = 0;

  bool isPowerOn = false;

  List<String> history = [];

  void togglePower() {
    setState(() {
      isPowerOn = !isPowerOn;

      String status = isPowerOn ? 'Power ON' : 'Power OFF';

      history.insert(0, '$status - ${TimeOfDay.now().format(context)}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        username: widget.username,
        isPowerOn: isPowerOn,
        onToggle: togglePower,
      ),

      HistoryPage(history: history),

      ProfilePage(username: widget.username, email: widget.email),
    ];

    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.bolt_outlined),
            selectedIcon: Icon(Icons.bolt),
            label: 'Home',
          ),
          NavigationDestination(icon: Icon(Icons.history), label: 'History'),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
