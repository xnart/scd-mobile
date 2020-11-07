import 'package:flutter/material.dart';
import 'package:scd_app/models/scd_list_model.dart';

typedef RowTapped<RecordModel> = void Function(RecordModel record);

class SCDTableSource extends DataTableSource {
  final List<SCDListModel> _records;
  final RowTapped onTap;

  SCDTableSource(this._records, {this.onTap}) {
    sort((record) => record.food, 0, true);
  }

  @override
  DataRow getRow(int index) {
    SCDListModel record = _records[index];
    return DataRow.byIndex(onSelectChanged: (s) => onTap(record), index: index, cells: [
      DataCell(SizedBox(
        width: 250,
        child: Text(
          record.food,
        ),
      )),
      DataCell(record.legal
          ? Icon(Icons.check, color: Colors.green)
          : Icon(
              Icons.block,
              color: Colors.red,
            )),
    ]);
  }

  void sort(Comparable<dynamic> Function(SCDListModel record) getField, int index, bool ascending) {
    _records.sort((a, b) {
      final aVal = getField(a);
      final bVal = getField(b);
      return ascending ? Comparable.compare(aVal, bVal) : Comparable.compare(bVal, aVal);
    });
    notifyListeners();
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _records.length;

  @override
  int get selectedRowCount => 0;
}
