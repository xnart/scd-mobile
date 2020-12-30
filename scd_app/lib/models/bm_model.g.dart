// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BMModel _$BMModelFromJson(Map<String, dynamic> json) {
  return BMModel(
    type: json['type'] as int,
    date: stringToDateTime(json['date'] as String),
    blood: json['blood'] as bool,
  );
}

Map<String, dynamic> _$BMModelToJson(BMModel instance) => <String, dynamic>{
      'type': instance.type,
      'date': dateTimeToString(instance.date),
      'blood': instance.blood,
    };
