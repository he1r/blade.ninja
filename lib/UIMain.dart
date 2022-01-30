import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'CustomDrawer.dart';
import 'dataSource.dart';
import 'main.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class UIMain extends StatefulWidget {
  var dbIndex = 0;

  UIMain(var this.dbIndex, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainState(dbIndex);
  }
}

class MainState extends State<UIMain> {
  var fields;
  var controllers = [];
  var dbIndex = 0;
  var checkboxVal = 0; // temporary
  late JSONDataSource dataSource;

  MainState(this.dbIndex) {
    dataSource = JSONDataSource(
        const TextStyle(color: Colors.white),
        const TextStyle(
            color: Colors.white)); // create a grid data source with the data
    // dataSource.getLocalExample(); // get the local data
    fields = databazat[dbIndex][1];
    for (int i = 0; i < fields.length; i++) {
      controllers.add(TextEditingController(text: ""));
    }
  }

  Map generateJson() {
    final Map<String, Object> jsonData;
    jsonData = {
      "db": dbIndex + 1,
      // convention was set to start from 1 because of the web version
    };
    for (int i = 0; i < fields.length; i++) {
      jsonData[fields[i][2].toString()] = [
        fields[i][1] + checkboxVal,
        controllers[i].text
      ];
    }
    print(jsonData);
    return jsonData;
  }

  //REQUEST DATA FROM SERVER
  void data() {}

  void setDateText(var controller, var date) {
    controller.text = date;
  }

  Future<void> _selectDate(BuildContext context, var controller) async {
    var selectedDate = DateTime.now().toString();
    if (controller.text.isNotEmpty) {
      selectedDate = controller.text;
      print("----->>>>>" + selectedDate);
    }
    var startDate = DateTime.now();
    try {
      startDate = DateTime.parse(controller.text);
    }
    // ignore: empty_catches
    on Exception {}

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime.parse("1800-01-01"),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setDateText(controller, picked.toString().split(" ")[0]);
      print("---->>" + picked.toString());
      selectedDate = picked.toString();
    }
  }

  List<Widget> generateInputFields(BuildContext context) {
    List<Widget> widgets_list = [];
    for (int i = 0; i < fields.length; i++) {
      if (fields[i][2] == 'Datelindja') {
        widgets_list.add(
          Stack(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 4,
                    height: 1,
                  ),
                  // simple space
                  Expanded(
                    //                        padding: const EdgeInsets.all(1),
                    child: TextField(
//                          enabled: false,
                      decoration: InputDecoration(
//                            floatingLabelBehavior: FloatingLabelBehavior.always,
//                            hintText: "dd/mm/yyyy",
                        labelText: fields[i][0].toString(),
                      ),
                      controller: controllers[i],
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                    height: 2,
                  ),

                  // space where the button is meant to go
                ],
              ),
              Row(
                children: [
                  Expanded(
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () async {
                        final date = await showDatePicker(
                          initialEntryMode: DatePickerEntryMode.input,
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                      },
//                    yourUpdateDateFunction(date);
//                        onPressed: () => _selectDate(context, controllers[i]),
                      child: const Text(""),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                    height: 2,
                  ),
                ],
              ),
            ],
          ),
        );
      } else {
        widgets_list.add(Row(
          children: [
            const SizedBox(
              width: 4,
              height: 20,
            ),
            // simple space
            Expanded(
              //                        padding: const EdgeInsets.all(1),
              child: TextField(
                style: const TextStyle(
                    fontSize: 15.0,
                    height: 0.9,
                    color: Colors.white,
                    fontFamily: 'Akrobat-Bold'),
                decoration: InputDecoration(
                  labelText: fields[i][0].toString(),
                  alignLabelWithHint: true,
                ),
                controller: controllers[i],
              ),
            ),
            const SizedBox(
              width: 60,
              height: 2,
            ),
            // space where the button is meant to go
          ],
        ));
      }
      ;
    }
    return widgets_list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1f252e),
        ),
        scaffoldBackgroundColor: const Color(0xff1f2836),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.all(10),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey, width: 20)),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
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
          drawer: const CustomDrawer(),
          body: Padding(
              padding: const EdgeInsets.all(2),
              child: SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  ...generateInputFields(context), // INPUT FIELDS

                  const SizedBox(height: 20), // space for buttons

                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 40.0,
                        width: 40.0,
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          label: const Text(''),
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 6),
                            primary: const Color(0xff0b51d09),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: const BorderSide(
                                    color: Color(0xff0b51d09))),
                          ),
                          onPressed: () {
                            for (int i = 0; i < fields.length; i++) {
                              controllers[i].text = "";
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 40.0,
                        width: 40.0,
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          label: const Text(''),
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 6),
                            primary: const Color(0xff2769c4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side:
                                    const BorderSide(color: Color(0xff2769c4))),
                          ),
                          onPressed: () => dataSource.getData(
                              url_: 'https://blade.ninja/update',
                              requestJSON: generateJson()),
                        ),
                      ),
                    ],
                  ),
                  SfDataGridTheme(
                    data: SfDataGridThemeData(
                        gridLineColor: const Color(0xff009889),
                        headerColor: const Color(0xff009889)),
                    child: SfDataGrid(
                      // set the data source
                      source: dataSource,
                      // set the column width by calculating the max size among the header cell and among the cells in column.
                      columnWidthMode: ColumnWidthMode.auto,
                      // make sure the property above (columnWidthMode.auto) is applied in all rows
                      columnWidthCalculationRange:
                          ColumnWidthCalculationRange.allRows,
                      // add the columns array to the grid
                      columns: dataSource.gridColumnsList,
                      // *note that whatever changes you do to the data do not change
                      // the array/list or assign another list to columns property
                      // because it will change the address and the changes will
                      // not be reflected, this reference should never change, modify
                      // the list directly*
                    ),
                  ),
                ],
              )))),
    );
  }
}
