import 'package:json_annotation/json_annotation.dart';

part 'meal_model.g.dart';

stringToDateTime(String val) {
  return DateTime.parse(val);
}

dateTimeToString(DateTime val) {
  return val.toString();
}


@JsonSerializable()
class MealModel {
  List<String> foods;
  @JsonKey(fromJson: stringToDateTime, toJson: dateTimeToString)
  DateTime date;

  MealModel({this.foods, this.date});

  factory MealModel.fromJson(Map<String, dynamic> json) => _$MealModelFromJson(json);
  Map<String, dynamic> toJson() => _$MealModelToJson(this);
}
