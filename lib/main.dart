// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import './patronazhisti.dart';
import './gjendjaCivile.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'DataBaza',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/second': (context) => GjendjaCivile(),
        '/third': (context) => Patronazhisti(),
      },
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Theme.of(context).primaryColor,
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Gjendja Civile 2008"),
              onTap: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add_alt),
              title: const Text("Patronazhisti 2021"),
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
            const ListTile(
              leading: Icon(Icons.car_repair_rounded),
              title: Text("Targat 2021"),
            ),
            const ListTile(
              leading: Icon(Icons.person_search_sharp),
              title: Text("Targat + Patronazhisti 2021"),
            ),
            const ListTile(
              leading: Icon(Icons.money),
              title: Text("Rrogat Prill"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('DataBaza'),
      ),
    );
  }
}
