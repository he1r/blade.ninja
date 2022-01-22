import 'package:flutter/material.dart';
import 'CustomDrawer.dart';
import 'UIMain.dart';


const databazat=[["Gjendja Civile 2008", [['Emri', 0, 'Emri'], ['Mbiemri', 0, 'Mbiemri'], ['Atesia', 0, 'Atesia'], ['Amesia', 0, 'Amesia'], ['Datelindja', 0, 'Datelindja'], ['Id Kryefamiljari', 0, 'Id Kryefamiljari']]],
  ["Patronazhisti 2021", [['Emri', 0, 'Emri'], ['Mbiemri', 0, 'Mbiemri'], ['Atesia', 0, 'Atesia'], ['Amesia', 0, 'Amesia'], ['Datelindja', 0, 'Datelindja'], ['Id Kryefamiljari', 0, 'Id Kryefamiljari']]],
  ["Targat 2021", [['Emri', 0, 'Emri'], ['Mbiemri', 0, 'Mbiemri'], ['Atesia', 0, 'Atesia'], ['Amesia', 0, 'Amesia'], ['Datelindja', 0, 'Datelindja'], ['Id Kryefamiljari', 0, 'Id Kryefamiljari']]],
  ["Targat + Patronazhisti 2021", [['Emri', 0, 'Emri'], ['Mbiemri', 0, 'Mbiemri'], ['Atesia', 0, 'Atesia'], ['Amesia', 0, 'Amesia'], ['Datelindja', 0, 'Datelindja'], ['Id Kryefamiljari', 0, 'Id Kryefamiljari']]],
  ["Rrogat Prill", [['Emri', 0, 'Emri'], ['Mbiemri', 0, 'Mbiemri'], ['Atesia', 0, 'Atesia'], ['Amesia', 0, 'Amesia'], ['Datelindja', 0, 'Datelindja'], ['Id Kryefamiljari', 0, 'Id Kryefamiljari']]],
  ];


void main() {
  runApp(
    MaterialApp(
      title: 'DataBaza',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const HomeScreen(),
        '/0': (context) => UIMain(0),
        '/1': (context) => UIMain(1),
        '/2': (context) => UIMain(1),
        '/3': (context) => UIMain(1),
        '/4': (context) => UIMain(1),
        '/5': (context) => UIMain(1),
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
