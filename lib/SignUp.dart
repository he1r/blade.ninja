// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
//DATABASES LIST

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.indigo[900],
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.all(10),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          disabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
//          focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color: Colors.teal)
//          ),

//          border: InputBorder(borderSide: BorderSide(color: Colors.red)),
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            decorationColor: Colors.red,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.white,
          selectionHandleColor: Colors.white,
        ),
        textTheme: const TextTheme(
//          bodyText1: TextStyle(color: Colors.white),
//          bodyText2: TextStyle(color: Colors.white),
//          button: TextStyle(color: Colors.white),
//          caption: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white), // <-- input text color
//          headline1: TextStyle(color: Colors.white),
//          headline2: TextStyle(color: Colors.white),
//          headline3: TextStyle(color: Colors.white),
//          headline4: TextStyle(color: Colors.white),
//          headline5: TextStyle(color: Colors.white),
//          headline6: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            toolbarHeight: 80,
            title: Text('DataBaza',
                style: GoogleFonts.bebasNeue(
                    color: Colors.white,
                    fontSize: 50,
                    letterSpacing: 14,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
          ),
          body: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 750),
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
              margin: const EdgeInsets.only(left: 750),
              padding: const EdgeInsets.only(top: 20),
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
                  hintText: "Email",
                ),
              ),
            ),
            Container(
              width: 400,
              height: 100,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 750),
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
                  hintStyle: TextStyle(
                      color: Colors.white, fontFamily: 'Akrobat-Bold'),
                  border: InputBorder.none,
                  hintText: "Password",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 750),
              width: 120,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.lightBlue)),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ])),
    );
  }
}

//                          enabledBorder: OutlineInputBorder( //UnderlineInputBorder
//                            borderSide: BorderSide(color: Colors.white, width: 1.0, ),
//                          ),
//                          border: OutlineInputBorder(
//                              borderSide: BorderSide(color: Colors.teal)
//                          ),
//                          border: InputBorder.none,
//                          focusedBorder: InputBorder.none,
//                          enabledBorder: InputBorder.none,
//                          errorBorder: InputBorder.none,
//                          disabledBorder: InputBorder.none,

//border: InputBorder.none
