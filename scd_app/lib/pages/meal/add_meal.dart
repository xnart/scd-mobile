import 'package:flutter/material.dart';
import 'package:scd_app/components/MyAppBar.dart';

class AddMealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Add Meal",
      ),
    );
  }
}
