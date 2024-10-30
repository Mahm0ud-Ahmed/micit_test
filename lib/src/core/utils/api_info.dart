// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApiInfo {
  String endpoint;
  Map<String, dynamic>? data;
  Map<String, dynamic>? queries;
  int? page;
  int? pageSize;

  ApiInfo({
    required this.endpoint,
    this.data,
    this.queries,
    this.page = 1,
    this.pageSize = 20,
  });

  ApiInfo copyWith({
    String? endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queries,
    int? page,
    int? pageSize,
  }) {
    return ApiInfo(
      endpoint: endpoint ?? this.endpoint,
      data: data ?? this.data,
      queries: queries ?? this.queries,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  String toString() {
    return 'ApiInfo(endpoint: $endpoint, data: $data, queries: $queries, page: $page, pageSize: $pageSize)';
  }
}
