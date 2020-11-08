import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:scd_app/stores/scd_list_store.dart';

class SCDFoodListPage extends StatelessWidget {
  final SCDListStore scdListStore = Get.find();
  static GlobalKey<PaginatedDataTableState> tableKey = GlobalKey<PaginatedDataTableState>();

  SCDFoodListPage() {
    scdListStore.fetchSCDFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: PaginatedDataTable(
            key: tableKey,
            columnSpacing: 0,
            sortAscending: scdListStore.ascending,
            showCheckboxColumn: false,
            rowsPerPage: MediaQuery.of(context).size.height ~/ 90,
            sortColumnIndex: scdListStore.sortIndex,
            columns: [
              DataColumn(
                onSort: (i, asc) => scdListStore.sort((foodModel) => foodModel.food, i, asc),
                label: Text(
                  'Food',
                ),
              ),
              DataColumn(
                numeric: true,
                label: Text('Legal'),
              ),
            ],
            source: scdListStore.tableSource,
            header: Text("SCD Food List"),
          ),
        ),
      ),
    );
  }
}
