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
      )
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
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          padding: EdgeInsets.only(left: 50, right: 60),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
              borderRadius: BorderRadius.circular(15)
          ),
          child: DropdownButton<String>(
            value: valuex,
            icon: Icon(Icons.arrow_drop_down),
            iconEnabledColor: Colors.black,
            iconSize: 40,
            isExpanded: true,
            underline: SizedBox(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            dropdownColor: Colors.grey,
            onChanged: (value) {
            setState((){
            valuex = value!;
               });
            },
            hint: const Text("Zgjidh DataBazen"),
            items: listItem.map((valueItem) {
              return DropdownMenuItem<String>(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}