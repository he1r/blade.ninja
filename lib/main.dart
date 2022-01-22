// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import './patronazhisti.dart';
import './gjendjaCivile.dart';
import 'CustomDrawer.dart';

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
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('DataBaza'),
      ),
    );
  }
}
