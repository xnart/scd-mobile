import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:scd_app/bindings/AddMealBinding.dart';
import 'package:scd_app/bindings/HomeBinding.dart';
import 'package:scd_app/pages/bm/add_bm.dart';
import 'package:scd_app/pages/bm/bm_calendar.dart';
import 'package:scd_app/pages/bm/bm_page.dart';
import 'package:scd_app/pages/loading_screen.dart';
import 'package:scd_app/pages/login.dart';
import 'package:scd_app/pages/meal/add_meal.dart';
import 'package:scd_app/stores/connectivity_store.dart';

import 'bindings/bm_binding.dart';
import 'pages/home/home.dart';

Connectivity connectivity;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (connectivity.isNull) {
    connectivity = Connectivity();
  }
  Get.put(ConnectivityStore());

  var status = await connectivity.checkConnectivity();

  if (status == ConnectivityResult.none) {
    FirebaseFirestore.instance.disableNetwork();
  } else {
    FirebaseFirestore.instance.enableNetwork();
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ConnectivityStore connectivityStore = Get.find();
  var disposer;

  @override
  void initState() {
    super.initState();
    disposer = reaction((_) => connectivityStore.connectivityStream.value, (result) async {
      if (result == ConnectivityResult.none) {
        await FirebaseFirestore.instance.disableNetwork();
        print("network disabled");
      } else {
        await FirebaseFirestore.instance.enableNetwork();
        print("network enabled");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Roboto",
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: "/loading",
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(name: "/loading", page: () => LoadingPage()),
        GetPage(name: "/", page: () => HomePage(), binding: HomeBinding()),
        GetPage(name: "/login", page: () => LoginPage(), binding: HomeBinding()),
        GetPage(name: "/addMeal", page: () => AddMealPage(), binding: AddMealBinding()),
        GetPage(name: "/addBM", page: () => AddBowelMovementPage(), binding: BMBinding()),
        GetPage(name: "/bmHistory", page: () => BMPage(), binding: BMBinding()),
      ],
    );
  }
}
