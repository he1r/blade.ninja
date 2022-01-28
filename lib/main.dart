import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CustomDrawer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// [0] name as it should be shown in the text input
// [1] default LIKE search boolean
// [2] column name on database

const databazat = [
  [
    "Gjendja Civile 2008",
    [
      ['Emri', 0, 'Emri'],
      ['Mbiemri', 0, 'Mbiemri'],
      ['Atesia', 0, 'Atesia'],
      ['Amesia', 0, 'Amesia'],
      ['Datelindja', 1, 'Datelindja'],
      ['Id Kryefamiljari', 0, 'Id Kryefamiljari']
    ]
  ],
  [
    "Patronazhisti 2021",
    [
      ['Emri', 0, 'Emri'],
      ['Mbiemri', 0, 'Mbiemri'],
      ['Atesia', 0, 'Atesia'],
      ['Datelindja', 1, 'Datelindja'],
      ['Telefoni', 1, 'Tel'],
      ['Numri Personal', 0, 'NID']
    ]
  ],
  [
    "Targat 2021",
    [
      ['Targa', 1, 'Targa'],
      ['Emri', 0, 'Emri'],
      ['Mbiemri', 0, 'Mbiemri'],
      ['ID Pronari', 0, 'ID Pronari']
    ]
  ],
  [
    "Targat + Patronazhisti 2021",
    [
      ['Targa', 1, 'Targa'],
      ['Emri', 0, 'Emri'],
      ['Mbiemri', 0, 'Mbiemri'],
      ['Telefoni', 1, "Tel"],
      ['ID Pronari', 0, 'ID Pronari']
    ]
  ],
  [
    "Rrogat Prill",
    [
      ['Emri', 0, 'Emri'],
      ['Mbiemri', 0, 'Mbiemri'],
      ['Numri Personal', 0, 'NID'],
      ['NIPT', 0, 'NIPT'],
      ['Subjekti', 1, 'Subjekti']
    ]
  ],
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
        backgroundColor: Colors.indigo[900],
        drawer: CustomDrawer(),
        appBar: AppBar(
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text('DataBaza',
              style: GoogleFonts.bebasNeue(
                  color: Colors.white,
                  fontSize: 50,
                  letterSpacing: 14,
                  fontWeight: FontWeight.bold)),
        ),
        body: Column(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 25),
            alignment: Alignment.center,
            width: 400,
            padding: const EdgeInsets.only(top: 200),
            child: const TextField(
              style: TextStyle(
                  fontSize: 18.0,
                  height: 1.1,
                  color: Colors.white,
                  fontFamily: 'Akrobat-Bold'),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black54,
                  hintStyle: TextStyle(
                      color: Colors.white, fontFamily: 'Akrobat-Bold'),
                  border: InputBorder.none,
                  hintText: 'Username'),
            ),
          ),
          Container(
            width: 400,
            height: 100,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 25),
            padding: const EdgeInsets.only(top: 20),
            child: const TextField(
              obscureText: true,
              style: TextStyle(
                  fontSize: 18.0,
                  height: 1.1,
                  color: Colors.white,
                  fontFamily: 'Akrobat-Bold'),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black54,
                hintStyle:
                    TextStyle(color: Colors.white, fontFamily: 'Akrobat-Bold'),
                border: InputBorder.none,
                hintText: "Password",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 25),
            width: 120,
            height: 40,
            child: ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightBlue)),
              child: const Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 800, top: 50),
                child: const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                width: 120,
                height: 40,
                margin: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent)),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(top: 300, left: 775)),
              Container(
                child: GFButton(
                  onPressed: () {},
                  text: "he1r",
                  icon: const Icon(FontAwesomeIcons.github),
                  type: GFButtonType.outline2x,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: GFButton(
                  onPressed: () {},
                  text: "omega0verride",
                  icon: const Icon(FontAwesomeIcons.github),
                  type: GFButtonType.outline2x,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: GFButton(
                  onPressed: () {},
                  text: "blade.ninja",
                  icon: const Icon(Icons.web_asset_outlined),
                  type: GFButtonType.outline2x,
                ),
              ),
            ],
          )
        ]));
  }
}
