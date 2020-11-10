import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:scd_app/components/form_card.dart';
import 'package:scd_app/components/my_app_bar.dart';
import 'package:scd_app/stores/bm/add_bm_store.dart';

class AddBowelMovementPage extends StatelessWidget {
  final TextEditingController _timeController = TextEditingController(text: TimeOfDay.now().format(Get.context));
  final TextEditingController _stoolTypeController = TextEditingController();
  final TextEditingController _dateController =
      TextEditingController(text: formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));
  final AddBMStore store = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Add BM",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(
          builder: (_) => SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 15,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: FormCard(
                          child: TextField(
                            controller: _dateController,
                            decoration: InputDecoration(labelText: "Date", border: OutlineInputBorder()),
                            readOnly: true,
                            onTap: () {
                              _selectDate(context);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: FormCard(
                          child: TextField(
                            controller: _timeController,
                            decoration: InputDecoration(labelText: "Time", border: OutlineInputBorder()),
                            readOnly: true,
                            onTap: () {
                              _selectTime(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  FormCard(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Stool Bristol Type", border: OutlineInputBorder()),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        if (store.selectedStoolType == null) {
                          return "Please select stool type";
                        }
                        return null;
                      },
                      readOnly: true,
                      controller: _stoolTypeController,
                      onTap: () => _selectStoolType(context),
                    ),
                  ),
                  FormCard(
                    child: Wrap(
                      children: [
                        CheckboxListTile(
                            title: Text("Blood"), value: store.blood, onChanged: (val) => store.blood = val)
                      ],
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        store.save();
                      }
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSelectStoolType(val) {
    store.selectedStoolType = val;
    _stoolTypeController.text = "Type $val";
    Get.back();
  }

  Widget buildStoolType() {
    List<Widget> children = [];
    for (var i = 1; i <= 7; i++) {
      var column = InkWell(
        onTap: () => _onSelectStoolType(i),
        child: Material(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset("assets/stools/type$i.jpg"),
              SizedBox(height: 5),
              Text("Type $i", textScaleFactor: 1.2),
              Radio(value: i, groupValue: store.selectedStoolType, onChanged: _onSelectStoolType)
            ],
          ),
        ),
      );
      children.add(column);
    }
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: FormCard(
        child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: children),
      ),
    );
  }

  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: store.selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _dateController.text = formatDate(picked, [yyyy, '-', mm, '-', dd]);
      return store.selectedDate = picked;
    }
    return DateTime.now();
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(context: context, initialTime: store.selectedTime);
    if (picked != null) {
      _timeController.text = picked.format(context);
      return store.selectedTime = picked;
    }
    return TimeOfDay.now();
  }

  _selectStoolType(BuildContext context) {
    Get.dialog(Observer(builder: (_) => buildStoolType()));
  }
}
