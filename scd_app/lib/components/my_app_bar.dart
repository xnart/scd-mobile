import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:scd_app/stores/navigation_store.dart';
import 'package:scd_app/stores/scd_list_store.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final List<Widget> actions;
  final String title;
  final _controller = TextEditingController();
  final NavigationStore navigationStore = Get.find();
  final SCDListStore scdListStore = Get.find();

  MyAppBar({Key key, this.height = 70, this.actions, this.title = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (_) => Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                if (Get.routing.current == "/") {
                } else {
                  Get.back();
                }
              },
              icon: Get.routing.current == "/"
                  ? IconButton(
                      icon: Icon(Icons.menu),
                      color: Colors.black,
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    )
                  : Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
            ),
            title: buildTitle(context),
            actions: [
              DropdownButtonHideUnderline(
                child: PopupMenuButton<String>(
                  icon: Icon(Icons.account_circle, color: Colors.black),
                  itemBuilder: (_) => <String>['Logout'].map((String value) {
                    return PopupMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onSelected: (val) async {
                    if(val == "Logout"){
                      await FirebaseAuth.instance.signOut();
                      Get.offAllNamed("/login");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(context) {
    if (navigationStore.currentPage == HomePages.SCD_LIST && Get.routing.current == "/") {
      return Container(
        height: 40,
        child: TextField(
          textInputAction: TextInputAction.search,
          controller: _controller,
          onChanged: scdListStore.search,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search food",
            suffixIcon: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                _controller.clear();
                scdListStore.search("");
              },
              icon: Icon(Icons.clear),
            ),
          ),
        ),
      );
    } else {
      return Text(
        title,
        style: TextStyle(color: Colors.black),
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
