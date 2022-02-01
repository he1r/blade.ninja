import 'package:flutter/material.dart';
import 'datePicker.dart';

// ignore: must_be_immutable
class CustomInputField extends StatefulWidget {
  late MainState _state;
  String _field = '';
  int _defaultCheckbox = 0;

  CustomInputField({Key? key, required field, required defaultCheckbox})
      : super(key: key) {
    _field = field;
    _defaultCheckbox = defaultCheckbox;
  }

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    _state = MainState(field: _field, defaultCheckbox: _defaultCheckbox);
    return _state;
  }

  String getValue() {
    return _state.getValue();
  }

  void resetValue() {
    _state.resetValue();
  }

  int getCheckBox() {
    return _state.getCheckBox();
  }
}

class MainState extends State<CustomInputField> {
  String _field = '';
  int _defaultCheckbox = 0;
  bool _isDate = false;
  bool _checkBoxVal = false;
  late final TextEditingController _controller;
  late SliderDatePicker _datePicker;

  MainState({Key? key, required field, required defaultCheckbox}) {
    _field = field;
    _defaultCheckbox = defaultCheckbox;
    _isDate = _field == 'Datelindja';
  }

  @override
  void initState() {
    super.initState();
    if (_isDate) {
      _datePicker = SliderDatePicker(date: "Datelindja");
    } else {
      _controller = TextEditingController(text: "");
    }
  }

  @override
  Widget build(BuildContext context) {
    Container _checkbox;
    if (_isDate) {
      return _datePicker;
    }
    if (_defaultCheckbox == 1) {
      _checkbox = Container(
        padding: const EdgeInsets.all(28),
//        child: SizedBox(height: 20, width: 20,),
      );
    } else {
      _checkbox = Container(
        padding: const EdgeInsets.only(right: 10, top: 12, left: 10),
        child: Checkbox(
          value: _checkBoxVal,
          onChanged: (value) => checkboxClicked(),
          side: const BorderSide(
            // ======> CHANGE THE BORDER COLOR HERE <======
            color: Colors.white,
            // Give your checkbox border a custom width
            width: 1.5,
          ),
        ),
      );
    }
    return Row(
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
              labelText: _field,
              alignLabelWithHint: true,
            ),
            controller: _controller,
          ),
        ),
        _checkbox,
      ],
    );
  }

  void checkboxClicked() {
    setState(() {
      _checkBoxVal = !_checkBoxVal;
    });
  }

  void resetValue() {
    if (_isDate) {
      _datePicker.reset();
    } else {
      _controller.text = "";
    }
    setState(() {
      _checkBoxVal = false;
    });
  }

  String getValue() {
    if (_isDate) {
      return _datePicker.getDate();
    } else {
      return _controller.text;
    }
  }

  int getCheckBox() {
    if (_defaultCheckbox == 0) {
      return _checkBoxVal == true ? 1 : 0;
    }
    return 1;
  }
}
