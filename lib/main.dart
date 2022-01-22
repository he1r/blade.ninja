import 'package:flutter/material.dart';
import 'CustomDrawer.dart';

// [0] name as it should be shown in the text input
// [1] default LIKE search boolean
// [2] column name on database

const databazat=[["Gjendja Civile 2008", [['Emri', 0, 'Emri'], ['Mbiemri', 0, 'Mbiemri'], ['Atesia', 0, 'Atesia'], ['Amesia', 0, 'Amesia'], ['Datelindja', 1, 'Datelindja'], ['Id Kryefamiljari', 0, 'Id Kryefamiljari']]],
  ["Patronazhisti 2021", [['Emri', 0, 'Emri'], ['Mbiemri', 0, 'Mbiemri'], ['Atesia', 0, 'Atesia'], ['Datelindja', 1, 'Datelindja'], ['Telefoni', 1, 'Tel'], ['Numri Personal', 0, 'NID']]],
  ["Targat 2021", [['Targa', 1, 'Targa'], ['Emri', 0, 'Emri'], ['Mbiemri', 0, 'Mbiemri'], ['ID Pronari', 0, 'ID Pronari']]],
  ["Targat + Patronazhisti 2021", [['Targa', 1, 'Targa'], ['Emri', 0, 'Emri'], ['Mbiemri', 0, 'Mbiemri'], ['Telefoni', 1, "Tel"], ['ID Pronari', 0, 'ID Pronari']]],
  ["Rrogat Prill", [['Emri', 0, 'Emri'], ['Mbiemri', 0, 'Mbiemri'], ['Numri Personal', 0, 'NID'], ['NIPT', 0, 'NIPT'], ['Subjekti', 1, 'Subjekti']]],
  ];


void main() {
  runApp(
    MaterialApp(
      title: 'DataBaza',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const HomeScreen(),
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
