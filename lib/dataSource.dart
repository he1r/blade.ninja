import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class JSONDataSource extends DataGridSource {
  // create an empty grid column list, it will be populated with data later on
  List<GridColumn> gridColumnsList = [];

  // create empty grid row list, it will be populated with data later on
  List<DataGridRow> dataRows = [];

  // *note that whatever changes you do to the data do not change
  // the array/list or assign another list to columns property
  // because it will change the address and the changes will
  // not be reflected, this reference should never change, modify
  // the list directly*

  var data; // variable to hold json data

  JSONDataSource([var data]) {
    // data is optional since you can create the source without initial data
    if (data != null) {
      // update only if data is not null
      updateData(data: data);
    }
  }

  void updateData({required var data}) {
    // get array of keys
    print(data);
    generateColumns(data["headers"]);
    dataRows.clear(); // remove the previous data and add the new one
    print(data);
    for (int i = 0; i < data["num"]; i++) {
      List<DataGridCell> _cells = [];
      for (int j = 0; j < data["len"]; j++) {
        _cells.add(DataGridCell(
            columnName: data["headers"][j], value: data["data"][i][j]));
      }
      dataRows.add(DataGridRow(cells: _cells));
    }

    notifyListeners(); // signal an update
  }

  // generate the list of grd columns based on the array of table headers
  void generateColumns(var headers) {
    gridColumnsList.clear();
    for (var h in headers) {
      gridColumnsList.add(
        GridColumn(
            columnName: h.toString(),
            autoFitPadding: EdgeInsets.all(12.0),
            label: Container(
                padding: EdgeInsets.all(12.0),
                alignment: Alignment.center,
                child: Text(
                  h.toString(),
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
    data = d;
    updateData(data: data);
    return data;
  }


  void getExampleDataFromAPI() async {
    getData(url_: 'https://blade.ninja/update', requestJSON: {"db": 1, "Emri": [1, "a"]} );
  }

  // make get request to get json data
  void getData({required String url_, required Map requestJSON}) async {
    var url = Uri.parse(url_);
    var body = jsonEncode(requestJSON);
    post(url, body: jsonEncode(body)).then((Response response) {
      data = jsonDecode(response.body);
      updateData(data: data);
    });
  }


  @override
  List<DataGridRow> get rows => dataRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12.0),
            child: Text(
              e.value.toString(),
            ),
          );
        }).toList());
  }
}