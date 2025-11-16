import 'package:flutter/material.dart';

void main() => runApp(MyHairApp());

class MyHairApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HairHome(),
    );
  }
}

class HairHome extends StatefulWidget {
  @override
  _HairHomeState createState() => _HairHomeState();
}

class _HairHomeState extends State<HairHome> {
  List<Map> steps = [
    {'emoji': '👶', 'time': '7:00 AM', 'task': 'Drink 2 glasses water', 'done': false},
    {'emoji': '🚿', 'time': '7:15 AM', 'task': 'Splash water on head', 'done': false},
    {'emoji': '👋', 'time': '7:30 AM', 'task': 'Pat dry gently', 'done': false},
    {'emoji': '🥥', 'time': '7:40 AM', 'task': '2 drops coconut oil', 'done': false},
    {'emoji': '🌵', 'time': '5:30 PM', 'task': 'Aloe vera massage', 'done': false},
    {'emoji': '😴', 'time': '10:00 PM', 'task': 'Sleep with loose cap', 'done': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('🍼 MY HAIR ROUTINE'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Header
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
            ),
            child: Column(
              children: [
                Text('🌟 YOU ARE HAIR SUPERHERO!', 
                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Do every day → Get silky hair! 🌟',
                     textAlign: TextAlign.center),
              ],
            ),
          ),
          
          // Steps List
          Expanded(
            child: ListView.builder(
              itemCount: steps.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: steps[index]['done'] ? Colors.green : Colors.blue,
                      child: Text('${index + 1}', style: TextStyle(color: Colors.white)),
                    ),
                    title: Row(children: [
                      Text(steps[index]['emoji']),
                      SizedBox(width: 8),
                      Text(steps[index]['time']),
                    ]),
                    subtitle: Text(steps[index]['task']),
                    trailing: Icon(
                      steps[index]['done'] ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: steps[index]['done'] ? Colors.green : Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                        steps[index]['done'] = !steps[index]['done'];
                      });
                    },
                  ),
                );
              },
            ),
          ),
          
          // Products
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('🛍 NEED THESE:', 
                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(label: Text('🥥 Coconut Oil')),
                    Chip(label: Text('🌰 Castor Oil')),
                    Chip(label: Text('🧴 Baby Shampoo')),
                    Chip(label: Text('🌵 Aloe Vera')),
                    Chip(label: Text('🤍 Cotton Hanky')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
