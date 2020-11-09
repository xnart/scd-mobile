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
                  ? Icon(
                      Icons.menu,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
            ),
            title: buildTitle(context),
            actions: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://banner2.cleanpng.com/20180920/yko/kisspng-computer-icons-portable-network-graphics-avatar-ic-5ba3c66df14d32.3051789815374598219884.jpg"),
              )
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
