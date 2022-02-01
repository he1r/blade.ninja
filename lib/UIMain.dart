import 'package:databaza/inputField.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'CustomDrawer.dart';
import 'dataSource.dart';
import 'main.dart';
import 'datePicker.dart';
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
  List<CustomInputField> _widgets_list = [];
  var fields;
  var dbIndex = 0;
  var checkboxVal = 0; // temporary
  late JSONDataSource dataSource;

  void refresh() {
    setState(() {
      checkboxVal = 1;
    });
  }

  MainState(this.dbIndex) {
    dataSource = JSONDataSource(
        const TextStyle(color: Colors.white),
        const TextStyle(
            color: Colors.white)); // create a grid data source with the data
    // dataSource.getLocalExample(); // get the local data
    fields = databazat[dbIndex][1];
  }

  Map generateJson() {
    final Map<String, Object> jsonData;
    jsonData = {
      "db": dbIndex + 1,
      // convention was set to start from 1 because of the web version
    };
    for (int i = 0; i < fields.length; i++) {
      jsonData[fields[i][2].toString()] = [
        _widgets_list[i].getCheckBox(),
        _widgets_list[i].getValue()
      ];
    }
    print(jsonData);
    return jsonData;
  }

  List<CustomInputField> generateInputFields(BuildContext context) {
    if (_widgets_list.isEmpty) {
      for (int i = 0; i < fields.length; i++) {
        _widgets_list.add(CustomInputField(
            field: fields[i][2], defaultCheckbox: fields[i][1]));
      }
    }
    return _widgets_list;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _widgets_list = generateInputFields(context);
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1f252e),
        ),
        scaffoldBackgroundColor: const Color(0xff1f2836),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.all(10),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
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
                      ..._widgets_list, // INPUT FIELDS

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
                                  _widgets_list[i].resetValue();
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
