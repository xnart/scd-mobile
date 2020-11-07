import 'package:json_annotation/json_annotation.dart';

part 'scd_list_model.g.dart';

bool legalFromJson(String val) {
  if (val.toLowerCase() == "legal") {
    return true;
  }
  return false;
}

@JsonSerializable()
class SCDListModel {
  String food;
  @JsonKey(fromJson: legalFromJson)
  bool legal;
  String note;

  SCDListModel({this.food, this.legal, this.note});

  factory SCDListModel.fromJson(Map<String, dynamic> json) => _$SCDListModelFromJson(json);
}
