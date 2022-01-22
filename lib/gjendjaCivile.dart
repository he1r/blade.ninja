import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './patronazhisti.dart';
import 'CustomDrawer.dart';

class GjendjaCivile extends StatelessWidget {
  // define the columns an the default LIKE search boolean
  var fields = [['Emri', 0], ['Mbiemri', 0], ['Atesia', 0], ['Amesia', 0], ['Datelindja', 0], ['Id Kryefamiljari', 0]];

  var controllers=[];
  GjendjaCivile() {
    for (int i = 0; i < fields.length; i++){
      controllers.add(TextEditingController(text: ""));
    }
  }
  
  Map generateJson() {
    final Map<String, Object> jsonData;
    jsonData = {
      "db": 1,
    };
    for (int i = 0; i < fields.length; i++) {
      jsonData[fields[i][0].toString()]=[0, controllers[i].text];
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
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
//          focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color: Colors.teal)
//          ),
          border: OutlineInputBorder(),
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            decorationColor: Colors.red,
          ),

        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.red,
            selectionColor: Colors.white,
            selectionHandleColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.blue),
          bodyText2: TextStyle(color: Colors.blue),
          button: TextStyle(color: Colors.blue),
          caption: TextStyle(color: Colors.blue),
          subtitle1: TextStyle(color: Colors.blue), // <-- input text color
          headline1: TextStyle(color: Colors.blue),
          headline2: TextStyle(color: Colors.blue),
          headline3: TextStyle(color: Colors.blue),
          headline4: TextStyle(color: Colors.blue),
          headline5: TextStyle(color: Colors.blue),
          headline6: TextStyle(color: Colors.blue),
        ),
      ),


      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Gjendja Civile 2008"),
          ),
          drawer: CustomDrawer(),
          body: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: <Widget>[
                  for( int i = 0 ; i < fields.length ; i++)
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: fields[i][0].toString(),
                        ),
                        controller: controllers[i],
                      ),
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
