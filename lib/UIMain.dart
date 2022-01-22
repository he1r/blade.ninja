import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'CustomDrawer.dart';
import 'main.dart';

class UIMain extends StatelessWidget {

  var fields;
  var controllers=[];
  var dbIndex=0;

  UIMain(this.dbIndex, {Key? key}) : super(key: key) {
      fields = databazat[dbIndex][1];
    for (int i = 0; i < fields.length; i++) {
      controllers.add(TextEditingController(text: ""));
    }
  }
  
  Map generateJson() {
    final Map<String, Object> jsonData;
    jsonData = {
      "db": dbIndex,
    };
    for (int i = 0; i < fields.length; i++) {
      jsonData[fields[i][2].toString()]=[0, controllers[i].text];
    }
    print(jsonData);
    return jsonData;
  }

  //REQUEST DATA FROM SERVER
  void data() async {
    var url = Uri.parse('https://blade.ninja/update');
    var body = jsonEncode(generateJson());
    post(url,
//    headers: {"Content-Type": "application/json", "Access-Control-Allow-Origin": "*"},
            body: jsonEncode(body))
        .then((Response response) {
      print(response.body);
    });
  }

//DATABASES LIST

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff1f252e),
        ),
        scaffoldBackgroundColor: Color(0xff1f2836),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.all(10),
          isDense: true,
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
            centerTitle: true,
            title: Text(databazat[dbIndex][0].toString()),
          ),
          drawer: CustomDrawer(),
          body: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: <Widget>[
                  for( int i = 0 ; i < fields.length ; i++)
                    Row(
                      children: [
                      const SizedBox(width: 4, height: 1,), // simple space
                      Expanded(
//                        padding: const EdgeInsets.all(1),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: fields[i][0].toString(),
                          ),
                          controller: controllers[i],
                        ),
                      ),
                      const SizedBox(width: 60, height: 2,), // space where the button is meant to go
                      ],
                    ),

                  const SizedBox(height: 20), // space for buttons

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 40.0,
                        width: 40.0,
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          label: Text(''),
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            padding:  EdgeInsets.only(left: 6),
                            primary:  const Color(0xff0b51d09),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: const BorderSide(color: Color(0xff0b51d09))),
                          ),
                          onPressed: (){for(int i=0; i<fields.length; i++){controllers[i].text="";}},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 40.0,
                        width: 40.0,
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          label: Text(''),
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            padding:  EdgeInsets.only(left: 6),
                            primary:  const Color(0xff2769c4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: const BorderSide(color: Color(0xff2769c4))),
                          ),
                          onPressed: data,
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
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
