import 'package:json_annotation/json_annotation.dart';

part 'bm_model.g.dart';

stringToDateTime(String val) {
  return DateTime.parse(val);
}

dateTimeToString(DateTime val) {
  return val.toString();
}


@JsonSerializable()
class BMModel {
  int type;
  @JsonKey(fromJson: stringToDateTime, toJson: dateTimeToString)
  DateTime date;
  bool blood;

  BMModel({this.type, this.date, this.blood});

  factory BMModel.fromJson(Map<String, dynamic> json) => _$BMModelFromJson(json);
  Map<String, dynamic> toJson() => _$BMModelToJson(this);
}
