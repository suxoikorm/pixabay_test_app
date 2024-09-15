// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotosState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<PhotoEntity> get photos => throw _privateConstructorUsedError;

  /// Create a copy of PhotosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotosStateCopyWith<PhotosState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotosStateCopyWith<$Res> {
  factory $PhotosStateCopyWith(
          PhotosState value, $Res Function(PhotosState) then) =
      _$PhotosStateCopyWithImpl<$Res, PhotosState>;
  @useResult
  $Res call({bool isLoading, List<PhotoEntity> photos});
}

/// @nodoc
class _$PhotosStateCopyWithImpl<$Res, $Val extends PhotosState>
    implements $PhotosStateCopyWith<$Res> {
  _$PhotosStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotosStateImplCopyWith<$Res>
    implements $PhotosStateCopyWith<$Res> {
  factory _$$PhotosStateImplCopyWith(
          _$PhotosStateImpl value, $Res Function(_$PhotosStateImpl) then) =
      __$$PhotosStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<PhotoEntity> photos});
}

/// @nodoc
class __$$PhotosStateImplCopyWithImpl<$Res>
    extends _$PhotosStateCopyWithImpl<$Res, _$PhotosStateImpl>
    implements _$$PhotosStateImplCopyWith<$Res> {
  __$$PhotosStateImplCopyWithImpl(
      _$PhotosStateImpl _value, $Res Function(_$PhotosStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? photos = null,
  }) {
    return _then(_$PhotosStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoEntity>,
    ));
  }
}

/// @nodoc

class _$PhotosStateImpl implements _PhotosState {
  const _$PhotosStateImpl(
      {this.isLoading = false, final List<PhotoEntity> photos = const []})
      : _photos = photos;

  @override
  @JsonKey()
  final bool isLoading;
  final List<PhotoEntity> _photos;
  @override
  @JsonKey()
  List<PhotoEntity> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'PhotosState(isLoading: $isLoading, photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotosStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_photos));

  /// Create a copy of PhotosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotosStateImplCopyWith<_$PhotosStateImpl> get copyWith =>
      __$$PhotosStateImplCopyWithImpl<_$PhotosStateImpl>(this, _$identity);
}

abstract class _PhotosState implements PhotosState {
  const factory _PhotosState(
      {final bool isLoading,
      final List<PhotoEntity> photos}) = _$PhotosStateImpl;

  @override
  bool get isLoading;
  @override
  List<PhotoEntity> get photos;

  /// Create a copy of PhotosState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotosStateImplCopyWith<_$PhotosStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
