import 'dart:convert';
import 'package:databaza/databazat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class JSONDataSource extends DataGridSource {
  // create an empty grid column list, it will be populated with data later on
  final List<GridColumn> _gridColumnsList = [];

  // create empty grid row list, it will be populated with data later on
  final List<DataGridRow> _dataRows = [];

  // *note that whatever changes you do to the data do not change
  // the array/list or assign another list to columns property
  // because it will change the address and the changes will
  // not be reflected, this reference should never change, modify
  // the list directly*

  int _dbIndex = 0;
  var _data; // variable to hold json data
  TextStyle rowsTextStyle = const TextStyle(color: Colors.white);
  TextStyle headersTextStyle = const TextStyle(color: Colors.white);

  JSONDataSource(this._dbIndex,
      [var rowsTextStyle, var headersTextStyle, var data]) {
    if (rowsTextStyle != null) {
      this.rowsTextStyle = rowsTextStyle;
    }
    if (headersTextStyle != null) {
      this.headersTextStyle = headersTextStyle;
    }
    // data is optional since you can create the source without initial data
    if (data != null) {
      // update only if data is not null
      updateData(data: _data);
    }
  }

  void clear() {
    generateColumns([]);
    _dataRows.clear(); // remove the previous data and add the new one
    notifyListeners(); // signal an update
  }

  void updateData({required var data}) {
    if (data['num'] > 0) {
      if (_dbIndex == 0) {
        data['headers'][0] = '';
      }
      generateColumns(data["headers"]);
      _dataRows.clear(); // remove the previous data and add the new one
      for (int i = 0; i < data["num"]; i++) {
        List<DataGridCell> _cells = [];
        for (int j = 0; j < data["len"]; j++) {
          _cells.add(
            DataGridCell(
                columnName: data["headers"][j], value: data["data"][i][j]),
          );
        }
        _dataRows.add(DataGridRow(cells: _cells));
      }

      notifyListeners(); // signal an update
    } else {
      // TODO: show message no results found
    }
  }

  // generate the list of grd columns based on the array of table headers
  void generateColumns(var headers) {
    _gridColumnsList.clear();
    for (var h in headers) {
      _gridColumnsList.add(
        GridColumn(
            columnName: h.toString(),
            autoFitPadding: const EdgeInsets.all(12.0),
            label: Container(
                padding: const EdgeInsets.all(12.0),
                alignment: Alignment.center,
                child: Text(
                  h.toString(),
                  style: headersTextStyle,
                ))),
      );
    }
  }

  // get local json for testing
  Map getLocalExampleData() {
    var d = {
      "data": [
        [
          12060,
          "Indrit",
          "Jahaj",
          "Lavdosh",
          "Anila",
          "Mashkull",
          "29/12/2003",
          "Beqar / e",
          "Shqiptare",
          "Sarande,sarande",
          "Delvinë",
          "Blerimas",
          999,
          "Bir",
          "4451722997"
        ],
        [
          18276,
          "Indrit",
          "Alinani",
          "Mustafa",
          "Bukuri",
          "Mashkull",
          "04/05/1990",
          "Beqar / e",
          "Shqiptare",
          "Delvine,delvine",
          "Delvinë",
          "Rusan",
          22,
          "Bir",
          "4442845088"
        ],
        [
          18784,
          "Indrit",
          "Çobo",
          "Pajtim",
          "Shqipe",
          "Mashkull",
          "10/02/1983",
          "Beqar / e",
          "Shqiptare",
          "Delvine,delvine",
          "Delvinë",
          "Lagjia sinan ballaci",
          29,
          "Bir",
          "4442192846"
        ],
        [
          21421,
          "Indrit",
          "Barimi",
          "Spartak",
          "Zamira",
          "Mashkull",
          "17/09/1999",
          "Beqar / e",
          "Shqiptare",
          "Delvine,delvine",
          "Delvinë",
          "Lagjia \"sinan ballaci \"",
          31,
          "Bir",
          "4441692045"
        ],
        [
          123583,
          "Indrit",
          "Totraku",
          "Nazif",
          "Hamie",
          "Mashkull",
          "12/01/1992",
          "Beqar / e",
          "Shqiptare",
          "Lukan,diber",
          "Tiranë",
          "Bathore",
          999,
          "Bir",
          "3845840"
        ]
      ],
      "headers": [
        "Id",
        "Emri",
        "Mbiemri",
        "Atesia",
        "Amesia",
        "Gjinia",
        "Datelindja",
        "Gjendja Civile",
        "Kombesia",
        "Vendlindja",
        "Qyteti",
        "Adresa",
        "Nr Baneses",
        "Lidhja me Kryefamiljarin",
        "Id Kryefamiliari"
      ],
      "len": 15,
      "num": 5
    };
    _data = d;
    updateData(data: d);
    return d;
  }

  void getExampleDataFromAPI() async {
    getData(url_: Databazat.defaultUrl, requestJSON: {
      "db": 0,
      "Emri": [1, "a"]
    });
  }

  // make get request to get json data
  void getData({required String url_, required Map requestJSON}) async {
    if (checkJSON()) {
      post(Uri.parse(url_), body: jsonEncode(requestJSON))
          .then((Response response) {
        _data = jsonDecode(response.body);
        updateData(data: _data);
      });
    } else {
      //TODO: show message please fill at least 1 field
    }
  }

  bool checkJSON() {
    //TODO: implement validation
    return true;
  }

  @override
  List<DataGridRow> get rows => _dataRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    List<Widget> row_ = row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: Text(
          e.value.toString(),
          style: rowsTextStyle,
        ),
      );
    }).toList();
    // add "Familja" button for
    if (_dbIndex == 0) {
      row_[0] = Container(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              getFamily(row.getCells().last.value);
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            child: Text(
              'Familja',
              style: rowsTextStyle,
            ),
          ));
    }
    return DataGridRowAdapter(cells: row_);
  }

  void getFamily(var id) {
    var json = Databazat.familyJSON;
    json["Id_Kryefamiliari"] = [0, id];
    getData(url_: Databazat.defaultUrl, requestJSON: json);
  }

  List<GridColumn> get gridColumnsList => _gridColumnsList;

  get data => _data;
}
