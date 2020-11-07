import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:scd_app/components/MyAppBar.dart';
import 'package:scd_app/pages/scd_food_list.dart';
import 'package:scd_app/pages/greeting.dart';
import 'package:scd_app/stores/navigation_store.dart';

class HomePage extends StatelessWidget {
  final NavigationStore navigationStore = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => customPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: bottomBar(),
        appBar: MyAppBar(),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 35),
          child: AnimatedSwitcher(duration: Duration(seconds: 1), child: determinePage()),
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
    return Observer(builder: (_) {
      switch (navigationStore.currentPage) {
        case HomePages.GREETING:
          return GreetingPage(key: UniqueKey());
        case HomePages.SCD_LIST:
          return SCDFoodListPage(key: UniqueKey());
        default:
          return Container();
      }
    });
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
            icon: Icon(Icons.favorite_border),
            title: Text("SCD Food List"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
