// ignore_for_file: public_member_api_docs, sort_constructors_first

// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'api_pagination_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiPaginationModel<MODEL> {
  final int total;
  final int totalPages;
  final int page;
  final List<MODEL> data;

  const ApiPaginationModel({
    required this.total,
    required this.totalPages,
    required this.page,
    required this.data,
  });

  factory ApiPaginationModel.fromJson(
    Map<String, dynamic> json,
    MODEL Function(Object? json) fromJsonT,
  ) =>
      _$ApiPaginationModelFromJson(json, fromJsonT);

  ApiPaginationModel<T> copyWithChangeType<T>({
    int? total,
    int? perPage,
    int? currentPage,
    List<T>? data,
  }) {
    return ApiPaginationModel<T>(
      totalPages: total ?? this.totalPages,
      total: perPage ?? this.total,
      page: currentPage ?? this.page,
      data: data ?? this.data as List<T>,
    );
  }

  ApiPaginationModel<MODEL> copyWith({
    int? totalResults,
    int? totalPages,
    int? page,
    List<MODEL>? results,
  }) {
    return ApiPaginationModel<MODEL>(
      total: totalResults ?? this.total,
      totalPages: totalPages ?? this.totalPages,
      page: page ?? this.page,
      data: results ?? this.data,
    );
  }
}
