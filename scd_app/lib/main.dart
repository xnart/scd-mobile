import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scd_app/bindings/HomeBinding.dart';
import 'package:scd_app/pages/meal/add_meal.dart';

import 'pages/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Roboto",
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => HomePage(), binding: HomeBinding()),
        GetPage(name: "/addMeal", page: () => AddMealPage(), binding: HomeBinding()),
      ],
    );
  }
}
