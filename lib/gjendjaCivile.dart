import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './patronazhisti.dart';

class GjendjaCivile extends StatelessWidget {
  final emriController = TextEditingController(text: "");
  final mbiemriController = TextEditingController(text: "");
  final atesiaController = TextEditingController(text: "");
  final amesiaController = TextEditingController(text: "");
  final datelindjaController = TextEditingController(text: "");
  final idKryefamiljariController = TextEditingController(text: "");

  Map generateJson() {
    final Map<String, Object> jsonData;
    jsonData = {
      "db": 1,
      "Emri": [0, emriController.text],
      "Mbiemri": [0, mbiemriController.text],
      "Atesia": [0, atesiaController.text],
      "Amesia": [0, amesiaController.text],
      "Datelindja": [0, datelindjaController.text],
      "Id_Kryefamiliari": [0, idKryefamiljariController.text]
    };
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
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Gjendja Civile 2008"),
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Emri',
                    ),
                    controller: emriController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Mbiemri',
                    ),
                    controller: mbiemriController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Atesia',
                    ),
                    controller: atesiaController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Amesia',
                    ),
                    controller: amesiaController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Datelindja',
                    ),
                    controller: datelindjaController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Id Kryefamiljari',
                    ),
                    controller: idKryefamiljariController,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50.0,
                        margin: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff374ABE),
                                    Color(0xff64B6FF)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: const BoxConstraints(
                                  maxWidth: 250.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: const Text(
                                "Clear",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50.0,
                        margin: const EdgeInsets.all(50),
                        child: ElevatedButton(
                          onPressed: data,
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff374ABE),
                                    Color(0xff64B6FF)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: const BoxConstraints(
                                  maxWidth: 250.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: const Text(
                                "Search",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
