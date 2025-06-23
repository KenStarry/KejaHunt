// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_feature_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnitFeatureModel _$UnitFeatureModelFromJson(Map<String, dynamic> json) {
  return _UnitFeatureModel.fromJson(json);
}

/// @nodoc
mixin _$UnitFeatureModel {
  @JsonKey(name: "feature_name")
  String get featureName => throw _privateConstructorUsedError;
  @JsonKey(name: "feature_description")
  String? get featureDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "feature_icon_path")
  String get featureIconPath => throw _privateConstructorUsedError;

  /// Serializes this UnitFeatureModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnitFeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnitFeatureModelCopyWith<UnitFeatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitFeatureModelCopyWith<$Res> {
  factory $UnitFeatureModelCopyWith(
          UnitFeatureModel value, $Res Function(UnitFeatureModel) then) =
      _$UnitFeatureModelCopyWithImpl<$Res, UnitFeatureModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "feature_name") String featureName,
      @JsonKey(name: "feature_description") String? featureDescription,
      @JsonKey(name: "feature_icon_path") String featureIconPath});
}

/// @nodoc
class _$UnitFeatureModelCopyWithImpl<$Res, $Val extends UnitFeatureModel>
    implements $UnitFeatureModelCopyWith<$Res> {
  _$UnitFeatureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnitFeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureName = null,
    Object? featureDescription = freezed,
    Object? featureIconPath = null,
  }) {
    return _then(_value.copyWith(
      featureName: null == featureName
          ? _value.featureName
          : featureName // ignore: cast_nullable_to_non_nullable
              as String,
      featureDescription: freezed == featureDescription
          ? _value.featureDescription
          : featureDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      featureIconPath: null == featureIconPath
          ? _value.featureIconPath
          : featureIconPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnitFeatureModelImplCopyWith<$Res>
    implements $UnitFeatureModelCopyWith<$Res> {
  factory _$$UnitFeatureModelImplCopyWith(_$UnitFeatureModelImpl value,
          $Res Function(_$UnitFeatureModelImpl) then) =
      __$$UnitFeatureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "feature_name") String featureName,
      @JsonKey(name: "feature_description") String? featureDescription,
      @JsonKey(name: "feature_icon_path") String featureIconPath});
}

/// @nodoc
class __$$UnitFeatureModelImplCopyWithImpl<$Res>
    extends _$UnitFeatureModelCopyWithImpl<$Res, _$UnitFeatureModelImpl>
    implements _$$UnitFeatureModelImplCopyWith<$Res> {
  __$$UnitFeatureModelImplCopyWithImpl(_$UnitFeatureModelImpl _value,
      $Res Function(_$UnitFeatureModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnitFeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featureName = null,
    Object? featureDescription = freezed,
    Object? featureIconPath = null,
  }) {
    return _then(_$UnitFeatureModelImpl(
      featureName: null == featureName
          ? _value.featureName
          : featureName // ignore: cast_nullable_to_non_nullable
              as String,
      featureDescription: freezed == featureDescription
          ? _value.featureDescription
          : featureDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      featureIconPath: null == featureIconPath
          ? _value.featureIconPath
          : featureIconPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnitFeatureModelImpl implements _UnitFeatureModel {
  const _$UnitFeatureModelImpl(
      {@JsonKey(name: "feature_name") this.featureName = '',
      @JsonKey(name: "feature_description") this.featureDescription = null,
      @JsonKey(name: "feature_icon_path") this.featureIconPath = ''});

  factory _$UnitFeatureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitFeatureModelImplFromJson(json);

  @override
  @JsonKey(name: "feature_name")
  final String featureName;
  @override
  @JsonKey(name: "feature_description")
  final String? featureDescription;
  @override
  @JsonKey(name: "feature_icon_path")
  final String featureIconPath;

  @override
  String toString() {
    return 'UnitFeatureModel(featureName: $featureName, featureDescription: $featureDescription, featureIconPath: $featureIconPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitFeatureModelImpl &&
            (identical(other.featureName, featureName) ||
                other.featureName == featureName) &&
            (identical(other.featureDescription, featureDescription) ||
                other.featureDescription == featureDescription) &&
            (identical(other.featureIconPath, featureIconPath) ||
                other.featureIconPath == featureIconPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, featureName, featureDescription, featureIconPath);

  /// Create a copy of UnitFeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitFeatureModelImplCopyWith<_$UnitFeatureModelImpl> get copyWith =>
      __$$UnitFeatureModelImplCopyWithImpl<_$UnitFeatureModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitFeatureModelImplToJson(
      this,
    );
  }
}

abstract class _UnitFeatureModel implements UnitFeatureModel {
  const factory _UnitFeatureModel(
      {@JsonKey(name: "feature_name") final String featureName,
      @JsonKey(name: "feature_description") final String? featureDescription,
      @JsonKey(name: "feature_icon_path")
      final String featureIconPath}) = _$UnitFeatureModelImpl;

  factory _UnitFeatureModel.fromJson(Map<String, dynamic> json) =
      _$UnitFeatureModelImpl.fromJson;

  @override
  @JsonKey(name: "feature_name")
  String get featureName;
  @override
  @JsonKey(name: "feature_description")
  String? get featureDescription;
  @override
  @JsonKey(name: "feature_icon_path")
  String get featureIconPath;

  /// Create a copy of UnitFeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnitFeatureModelImplCopyWith<_$UnitFeatureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
