import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    determineRoute();
  }

  void determineRoute() async {
    StreamSubscription streamSubscription;
    streamSubscription = FirebaseAuth.instance.idTokenChanges().listen((user) async {
      if (user != null) {
        streamSubscription.cancel();
        await Get.offAllNamed("/");
      } else {
        streamSubscription.cancel();
        await Get.offAllNamed("/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
