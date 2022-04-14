// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Point _$_$_PointFromJson(Map<String, dynamic> json) {
  return _$_Point(
    id: json['id'] as int?,
    point: json['point'] as int? ?? 0,
    usedPoint: json['used_point'] as int,
  );
}

Map<String, dynamic> _$_$_PointToJson(_$_Point instance) => <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'used_point': instance.usedPoint,
    };
