// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealModel _$MealModelFromJson(Map<String, dynamic> json) {
  return MealModel(
    foods: (json['foods'] as List)?.map((e) => e as String)?.toList(),
    date: stringToDateTime(json['date'] as String),
  );
}

Map<String, dynamic> _$MealModelToJson(MealModel instance) => <String, dynamic>{
      'foods': instance.foods,
      'date': dateTimeToString(instance.date),
    };
