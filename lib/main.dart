import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataBaza',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
          title: "DataBaza",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List listItem = ["Zgjidh DataBazen","Gjendja Civile 2008", "Patronazhisti 2021", "Targat 2021", "Targat + Patronazhisti 2021", "Rrogat Prill"];
  String valuex = "Zgjidh DataBazen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text("DataBaza"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
      ),

        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(20),

                child: DropdownButton<String>(
                  value: valuex,

                  icon: const Icon(Icons.arrow_drop_down),
                  iconEnabledColor: Colors.black,
                  iconSize: 40,
                  isExpanded: true,

                  underline: const SizedBox(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),

                  items: listItem.map((valueItem) {
                    return DropdownMenuItem<String>(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState((){
                      valuex = value!;
                    });
                  },
                )
              ),

              const Padding(
                padding: EdgeInsets.all(1),

                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    labelText: 'Emri',
                      ),
                  ),
              ),

                const Padding(
                 padding: EdgeInsets.all(1),

                 child: TextField(
                   cursorColor: Colors.black,
                   decoration: InputDecoration(
                   border: InputBorder.none,
                   focusedBorder: InputBorder.none,
                   enabledBorder: InputBorder.none,
                   errorBorder: InputBorder.none,
                   disabledBorder: InputBorder.none,
                   labelText: 'Mbiemri',
                    ),
                  ),
               ),

              const Padding(
                padding: EdgeInsets.all(1),

                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: 'Atesia',
                ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(1),

                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: 'Amesia',
                ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(1),

                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: 'Datelindja',
                ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(1),

                child: TextField(
                  cursorColor: Colors.black,

                  decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: 'Id Kryefamiljari',
                ),
                ),
              ),

              Row(
                children:  [

                  Expanded(
                    child: Container(
                      height: 50.0,
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints:
                            const BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: const Text(
                              "Clear",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 15),
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
                        onPressed: () {},
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints:
                            const BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: const Text(
                              "Search",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          )
        )
    );
  }
}
