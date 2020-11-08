// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scd_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SCDListModel _$SCDListModelFromJson(Map<String, dynamic> json) {
  return SCDListModel(
    food: json['food'] as String,
    legal: legalFromJson(json['legal'] as String),
    note: json['note'] as String,
  );
}

Map<String, dynamic> _$SCDListModelToJson(SCDListModel instance) =>
    <String, dynamic>{
      'food': instance.food,
      'legal': instance.legal,
      'note': instance.note,
    };
