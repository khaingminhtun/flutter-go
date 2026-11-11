import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> history;

  const HistoryPage({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Power History')),

      body: history.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 65, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    'No power records yet',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: history.length,
              itemBuilder: (context, index) {
                bool powerOn = history[index].contains('ON -');

                return Card(
                  child: ListTile(
                    leading: Icon(
                      powerOn ? Icons.bolt : Icons.power_off,
                      color: powerOn ? Colors.green : Colors.red,
                    ),
                    title: Text(history[index]),
                  ),
                );
              },
            ),
    );
  }
}
