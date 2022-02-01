import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SliderDatePicker extends StatefulWidget {
  late MainState _state;
  String date = '';

  SliderDatePicker({Key? key, date}) : super(key: key) {
    if (date != null) {
      this.date = date;
    }
  }

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    _state = MainState(date);
    return _state;
  }

  String getDate() {
    return _state._dateValue;
  }

  void reset() {
    _state.reset();
  }
}

class MainState extends State<SliderDatePicker> {
  String _defaultDateText = "Datëlindja";
  String _dateText = '';
  String _dateValue = '';

  MainState(String date) {
    if (date != '') {
      _defaultDateText = date;
      _dateText = _defaultDateText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: const EdgeInsets.only(left: 5, top: 10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.black,

                  padding: EdgeInsets.only(left: -10),
//                          RoundedRectangleBorder(
//                            side: const BorderSide(
//                                color: Colors.orangeAccent
//                            ),
//                            borderRadius: BorderRadius.circular(5.0)),
                ),
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: const DatePickerTheme(
                        backgroundColor: Colors.black,
                        containerHeight: 210.0,
                        itemStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        doneStyle: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      showTitleActions: true,
                      minTime: DateTime(1900, 1, 1),
                      maxTime: DateTime.now(), onConfirm: (date) {
                    _dateText = '${date.day}/${date.month}/${date.year}';
                    _dateValue =
                        '${date.year}-${date.month}-${date.day}'; // the format that the database accepts and how it was design on the website
                    print(_dateText);
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const Icon(Icons.date_range, color: Colors.white),
                              Text(
                                "  $_dateText",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 50),
              height: 2,
              child: const Divider(
                color: Colors.blueGrey,
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  String getDate() {
    return _dateValue;
  }

  void reset() {
    _dateText = _defaultDateText;
    setState(() {});
  }
}
