// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiDataState<T> {
  String? get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id) idle,
    required TResult Function(String? id) loading,
    required TResult Function(T? data, T? response, String? id) success,
    required TResult Function(AppError? error, String? id) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id)? idle,
    TResult? Function(String? id)? loading,
    TResult? Function(T? data, T? response, String? id)? success,
    TResult? Function(AppError? error, String? id)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id)? idle,
    TResult Function(String? id)? loading,
    TResult Function(T? data, T? response, String? id)? success,
    TResult Function(AppError? error, String? id)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) success,
    required TResult Function(ApiDataError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? success,
    TResult? Function(ApiDataError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? success,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiDataStateCopyWith<T, ApiDataState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiDataStateCopyWith<T, $Res> {
  factory $ApiDataStateCopyWith(
          ApiDataState<T> value, $Res Function(ApiDataState<T>) then) =
      _$ApiDataStateCopyWithImpl<T, $Res, ApiDataState<T>>;
  @useResult
  $Res call({String? id});
}

/// @nodoc
class _$ApiDataStateCopyWithImpl<T, $Res, $Val extends ApiDataState<T>>
    implements $ApiDataStateCopyWith<T, $Res> {
  _$ApiDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiDataIdleImplCopyWith<T, $Res>
    implements $ApiDataStateCopyWith<T, $Res> {
  factory _$$ApiDataIdleImplCopyWith(_$ApiDataIdleImpl<T> value,
          $Res Function(_$ApiDataIdleImpl<T>) then) =
      __$$ApiDataIdleImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$ApiDataIdleImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataIdleImpl<T>>
    implements _$$ApiDataIdleImplCopyWith<T, $Res> {
  __$$ApiDataIdleImplCopyWithImpl(
      _$ApiDataIdleImpl<T> _value, $Res Function(_$ApiDataIdleImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$ApiDataIdleImpl<T>(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiDataIdleImpl<T> implements ApiDataIdle<T> {
  const _$ApiDataIdleImpl({this.id});

  @override
  final String? id;

  @override
  String toString() {
    return 'ApiDataState<$T>.idle(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDataIdleImpl<T> &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDataIdleImplCopyWith<T, _$ApiDataIdleImpl<T>> get copyWith =>
      __$$ApiDataIdleImplCopyWithImpl<T, _$ApiDataIdleImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id) idle,
    required TResult Function(String? id) loading,
    required TResult Function(T? data, T? response, String? id) success,
    required TResult Function(AppError? error, String? id) error,
  }) {
    return idle(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id)? idle,
    TResult? Function(String? id)? loading,
    TResult? Function(T? data, T? response, String? id)? success,
    TResult? Function(AppError? error, String? id)? error,
  }) {
    return idle?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id)? idle,
    TResult Function(String? id)? loading,
    TResult Function(T? data, T? response, String? id)? success,
    TResult Function(AppError? error, String? id)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) success,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? success,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? success,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class ApiDataIdle<T> implements ApiDataState<T> {
  const factory ApiDataIdle({final String? id}) = _$ApiDataIdleImpl<T>;

  @override
  String? get id;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiDataIdleImplCopyWith<T, _$ApiDataIdleImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiDataLoadingImplCopyWith<T, $Res>
    implements $ApiDataStateCopyWith<T, $Res> {
  factory _$$ApiDataLoadingImplCopyWith(_$ApiDataLoadingImpl<T> value,
          $Res Function(_$ApiDataLoadingImpl<T>) then) =
      __$$ApiDataLoadingImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String? id});
}

/// @nodoc
class __$$ApiDataLoadingImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataLoadingImpl<T>>
    implements _$$ApiDataLoadingImplCopyWith<T, $Res> {
  __$$ApiDataLoadingImplCopyWithImpl(_$ApiDataLoadingImpl<T> _value,
      $Res Function(_$ApiDataLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$ApiDataLoadingImpl<T>(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiDataLoadingImpl<T> implements ApiDataLoading<T> {
  const _$ApiDataLoadingImpl({this.id});

  @override
  final String? id;

  @override
  String toString() {
    return 'ApiDataState<$T>.loading(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDataLoadingImpl<T> &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDataLoadingImplCopyWith<T, _$ApiDataLoadingImpl<T>> get copyWith =>
      __$$ApiDataLoadingImplCopyWithImpl<T, _$ApiDataLoadingImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id) idle,
    required TResult Function(String? id) loading,
    required TResult Function(T? data, T? response, String? id) success,
    required TResult Function(AppError? error, String? id) error,
  }) {
    return loading(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id)? idle,
    TResult? Function(String? id)? loading,
    TResult? Function(T? data, T? response, String? id)? success,
    TResult? Function(AppError? error, String? id)? error,
  }) {
    return loading?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id)? idle,
    TResult Function(String? id)? loading,
    TResult Function(T? data, T? response, String? id)? success,
    TResult Function(AppError? error, String? id)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) success,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? success,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? success,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ApiDataLoading<T> implements ApiDataState<T> {
  const factory ApiDataLoading({final String? id}) = _$ApiDataLoadingImpl<T>;

  @override
  String? get id;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiDataLoadingImplCopyWith<T, _$ApiDataLoadingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiDataSuccessModelImplCopyWith<T, $Res>
    implements $ApiDataStateCopyWith<T, $Res> {
  factory _$$ApiDataSuccessModelImplCopyWith(_$ApiDataSuccessModelImpl<T> value,
          $Res Function(_$ApiDataSuccessModelImpl<T>) then) =
      __$$ApiDataSuccessModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? data, T? response, String? id});
}

/// @nodoc
class __$$ApiDataSuccessModelImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataSuccessModelImpl<T>>
    implements _$$ApiDataSuccessModelImplCopyWith<T, $Res> {
  __$$ApiDataSuccessModelImplCopyWithImpl(_$ApiDataSuccessModelImpl<T> _value,
      $Res Function(_$ApiDataSuccessModelImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? response = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ApiDataSuccessModelImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as T?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiDataSuccessModelImpl<T> implements ApiDataSuccessModel<T> {
  const _$ApiDataSuccessModelImpl({this.data, required this.response, this.id});

  @override
  final T? data;
  @override
  final T? response;
  @override
  final String? id;

  @override
  String toString() {
    return 'ApiDataState<$T>.success(data: $data, response: $response, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDataSuccessModelImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.response, response) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(response),
      id);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDataSuccessModelImplCopyWith<T, _$ApiDataSuccessModelImpl<T>>
      get copyWith => __$$ApiDataSuccessModelImplCopyWithImpl<T,
          _$ApiDataSuccessModelImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id) idle,
    required TResult Function(String? id) loading,
    required TResult Function(T? data, T? response, String? id) success,
    required TResult Function(AppError? error, String? id) error,
  }) {
    return success(data, response, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id)? idle,
    TResult? Function(String? id)? loading,
    TResult? Function(T? data, T? response, String? id)? success,
    TResult? Function(AppError? error, String? id)? error,
  }) {
    return success?.call(data, response, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id)? idle,
    TResult Function(String? id)? loading,
    TResult Function(T? data, T? response, String? id)? success,
    TResult Function(AppError? error, String? id)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, response, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) success,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? success,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? success,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ApiDataSuccessModel<T> implements ApiDataState<T> {
  const factory ApiDataSuccessModel(
      {final T? data,
      required final T? response,
      final String? id}) = _$ApiDataSuccessModelImpl<T>;

  T? get data;
  T? get response;
  @override
  String? get id;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiDataSuccessModelImplCopyWith<T, _$ApiDataSuccessModelImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiDataErrorImplCopyWith<T, $Res>
    implements $ApiDataStateCopyWith<T, $Res> {
  factory _$$ApiDataErrorImplCopyWith(_$ApiDataErrorImpl<T> value,
          $Res Function(_$ApiDataErrorImpl<T>) then) =
      __$$ApiDataErrorImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({AppError? error, String? id});

  $AppErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$ApiDataErrorImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataErrorImpl<T>>
    implements _$$ApiDataErrorImplCopyWith<T, $Res> {
  __$$ApiDataErrorImplCopyWithImpl(
      _$ApiDataErrorImpl<T> _value, $Res Function(_$ApiDataErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ApiDataErrorImpl<T>(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $AppErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ApiDataErrorImpl<T> implements ApiDataError<T> {
  const _$ApiDataErrorImpl({required this.error, this.id});

  @override
  final AppError? error;
  @override
  final String? id;

  @override
  String toString() {
    return 'ApiDataState<$T>.error(error: $error, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDataErrorImpl<T> &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, id);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDataErrorImplCopyWith<T, _$ApiDataErrorImpl<T>> get copyWith =>
      __$$ApiDataErrorImplCopyWithImpl<T, _$ApiDataErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? id) idle,
    required TResult Function(String? id) loading,
    required TResult Function(T? data, T? response, String? id) success,
    required TResult Function(AppError? error, String? id) error,
  }) {
    return error(this.error, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id)? idle,
    TResult? Function(String? id)? loading,
    TResult? Function(T? data, T? response, String? id)? success,
    TResult? Function(AppError? error, String? id)? error,
  }) {
    return error?.call(this.error, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id)? idle,
    TResult Function(String? id)? loading,
    TResult Function(T? data, T? response, String? id)? success,
    TResult Function(AppError? error, String? id)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) success,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? success,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? success,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ApiDataError<T> implements ApiDataState<T> {
  const factory ApiDataError(
      {required final AppError? error,
      final String? id}) = _$ApiDataErrorImpl<T>;

  AppError? get error;
  @override
  String? get id;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiDataErrorImplCopyWith<T, _$ApiDataErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
