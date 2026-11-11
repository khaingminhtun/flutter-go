import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;
  final bool isPowerOn;
  final VoidCallback onToggle;

  const HomePage({
    super.key,
    required this.username,
    required this.isPowerOn,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mee Bila'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.bolt, color: Colors.orange),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $username 👋',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text(
              'Track your electricity today.',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 2,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      const Text(
                        'CURRENT POWER STATUS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Icon(
                        Icons.bolt,
                        size: 75,
                        color: isPowerOn ? Colors.green : Colors.red,
                      ),

                      Text(
                        isPowerOn ? 'POWER ON' : 'POWER OFF',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: isPowerOn ? Colors.green : Colors.red,
                        ),
                      ),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: onToggle,
                          child: Text(
                            isPowerOn ? 'Record Power OFF' : 'Record Power ON',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Daily Power Tracker',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              'Manually record electricity availability '
              'to track your daily power schedule.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
