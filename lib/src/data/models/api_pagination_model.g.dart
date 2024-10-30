// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPaginationModel<MODEL> _$ApiPaginationModelFromJson<MODEL>(
  Map<String, dynamic> json,
  MODEL Function(Object? json) fromJsonMODEL,
) =>
    ApiPaginationModel<MODEL>(
      total: (json['total'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      data: (json['data'] as List<dynamic>).map(fromJsonMODEL).toList(),
    );

Map<String, dynamic> _$ApiPaginationModelToJson<MODEL>(
  ApiPaginationModel<MODEL> instance,
  Object? Function(MODEL value) toJsonMODEL,
) =>
    <String, dynamic>{
      'total': instance.total,
      'total_pages': instance.totalPages,
      'page': instance.page,
      'data': instance.data.map(toJsonMODEL).toList(),
    };
