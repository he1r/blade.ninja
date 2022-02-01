import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'UIMain.dart';
import 'SignUp.dart';

// [0] name as it should be shown in the text input
// [1] default LIKE search boolean
// [2] column name on database

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
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('DataBaza',
            style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: 30,
                letterSpacing: 7,
                fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            width: 300,
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
            width: 300,
            padding: const EdgeInsets.only(top: 10),
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
            margin: const EdgeInsets.only(top: 30),
            width: 120,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UIMain(0),
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightBlue)),
              child: const Text(
                "Sign In",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: const Text(
              "Don't have an account?",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          Container(
            width: 120,
            height: 40,
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent)),
              child: const Text(
                "Sign Up !",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
          const SizedBox(height: 100),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: GFButton(
                  onPressed: () {},
                  text: "he1r",
                  textStyle: const TextStyle(color: Colors.white),
                  icon: const Icon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                  ),
                  type: GFButtonType.transparent,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: GFButton(
                  onPressed: () {},
                  text: "omega0verride",
                  textStyle: const TextStyle(color: Colors.white),
                  icon: const Icon(
                    FontAwesomeIcons.github,
                    color: Colors.white,
                  ),
                  type: GFButtonType.transparent,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: GFButton(
                  onPressed: () {},
                  text: "blade.ninja",
                  textStyle: const TextStyle(color: Colors.white),
                  icon: const Icon(
                    Icons.web_asset_outlined,
                    color: Colors.white,
                  ),
                  type: GFButtonType.transparent,
                ),
              ),
            ],
          )
        ])),
      ),
    );
  }
}
