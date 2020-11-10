import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:scd_app/components/my_app_bar.dart';
import 'package:scd_app/pages/home/scd_food_list.dart';
import 'package:scd_app/pages/home/greeting.dart';
import 'package:scd_app/stores/navigation_store.dart';

class HomePage extends StatelessWidget {
  final NavigationStore navigationStore = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => customPop(context),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: bottomBar(),
        drawer: Drawer(
            child: ListView(
          children: [
            DrawerHeader(child: null),
            ListTile(
              leading: Icon(Icons.wc),
              title: Text("Bowel Movement Journal", textScaleFactor: 1.1),
              onTap: () {
                Get.back();
                Get.toNamed("bmHistory");
              },
            )
          ],
        )),
        appBar: MyAppBar(),
        body: Observer(
          builder: (_) => Container(
            child: AnimatedSwitcher(
                transitionBuilder: (Widget child, Animation<double> animation) {
                  var begin = Offset(-1.0, 0.0);
                  var end = Offset.zero;
                  var tween = Tween(begin: begin, end: end);
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(child: child, position: offsetAnimation);
                },
                duration: Duration(milliseconds: 300),
                child: determinePage()),
          ),
        ),
      ),
    );
  }

  Future<bool> customPop(BuildContext context) {
    var backStack = navigationStore.backStack;
    if (navigationStore.backStack.length > 1) {
      backStack.removeAt(backStack.length - 1);
      navigationStore.navigateBack(backStack[backStack.length - 1]);
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  Widget determinePage() {
    switch (navigationStore.currentPage) {
      case HomePages.GREETING:
        return GreetingPage();
      case HomePages.SCD_LIST:
        return SCDFoodListPage();
      default:
        return Container(key: UniqueKey());
    }
  }

  Widget bottomBar() {
    return Observer(
      builder: (_) => SalomonBottomBar(
        margin: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        currentIndex: navigationStore.currentIndex,
        onTap: navigationStore.navigateTo,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Greeting"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.list_alt),
            title: Text("SCD Food List"),
            selectedColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
