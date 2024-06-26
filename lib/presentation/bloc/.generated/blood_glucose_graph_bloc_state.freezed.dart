// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../blood_glucose_graph_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BloodGlucoseGraphBlocState {
  ViewStatus get viewStatus => throw _privateConstructorUsedError;
  GraphViewData get graphViewData => throw _privateConstructorUsedError;
  dynamic get targetBand => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BloodGlucoseGraphBlocStateCopyWith<BloodGlucoseGraphBlocState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodGlucoseGraphBlocStateCopyWith<$Res> {
  factory $BloodGlucoseGraphBlocStateCopyWith(BloodGlucoseGraphBlocState value,
          $Res Function(BloodGlucoseGraphBlocState) then) =
      _$BloodGlucoseGraphBlocStateCopyWithImpl<$Res,
          BloodGlucoseGraphBlocState>;
  @useResult
  $Res call(
      {ViewStatus viewStatus, GraphViewData graphViewData, dynamic targetBand});
}

/// @nodoc
class _$BloodGlucoseGraphBlocStateCopyWithImpl<$Res,
        $Val extends BloodGlucoseGraphBlocState>
    implements $BloodGlucoseGraphBlocStateCopyWith<$Res> {
  _$BloodGlucoseGraphBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewStatus = null,
    Object? graphViewData = null,
    Object? targetBand = freezed,
  }) {
    return _then(_value.copyWith(
      viewStatus: null == viewStatus
          ? _value.viewStatus
          : viewStatus // ignore: cast_nullable_to_non_nullable
              as ViewStatus,
      graphViewData: null == graphViewData
          ? _value.graphViewData
          : graphViewData // ignore: cast_nullable_to_non_nullable
              as GraphViewData,
      targetBand: freezed == targetBand
          ? _value.targetBand
          : targetBand // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodGlucoseGraphBlocStateImplCopyWith<$Res>
    implements $BloodGlucoseGraphBlocStateCopyWith<$Res> {
  factory _$$BloodGlucoseGraphBlocStateImplCopyWith(
          _$BloodGlucoseGraphBlocStateImpl value,
          $Res Function(_$BloodGlucoseGraphBlocStateImpl) then) =
      __$$BloodGlucoseGraphBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ViewStatus viewStatus, GraphViewData graphViewData, dynamic targetBand});
}

/// @nodoc
class __$$BloodGlucoseGraphBlocStateImplCopyWithImpl<$Res>
    extends _$BloodGlucoseGraphBlocStateCopyWithImpl<$Res,
        _$BloodGlucoseGraphBlocStateImpl>
    implements _$$BloodGlucoseGraphBlocStateImplCopyWith<$Res> {
  __$$BloodGlucoseGraphBlocStateImplCopyWithImpl(
      _$BloodGlucoseGraphBlocStateImpl _value,
      $Res Function(_$BloodGlucoseGraphBlocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewStatus = null,
    Object? graphViewData = null,
    Object? targetBand = freezed,
  }) {
    return _then(_$BloodGlucoseGraphBlocStateImpl(
      viewStatus: null == viewStatus
          ? _value.viewStatus
          : viewStatus // ignore: cast_nullable_to_non_nullable
              as ViewStatus,
      graphViewData: null == graphViewData
          ? _value.graphViewData
          : graphViewData // ignore: cast_nullable_to_non_nullable
              as GraphViewData,
      targetBand: freezed == targetBand ? _value.targetBand! : targetBand,
    ));
  }
}

/// @nodoc

class _$BloodGlucoseGraphBlocStateImpl extends _BloodGlucoseGraphBlocState {
  const _$BloodGlucoseGraphBlocStateImpl(
      {this.viewStatus = ViewStatus.initial,
      this.graphViewData = const GraphViewData([]),
      this.targetBand = const GraphTargetBand()})
      : super._();

  @override
  @JsonKey()
  final ViewStatus viewStatus;
  @override
  @JsonKey()
  final GraphViewData graphViewData;
  @override
  @JsonKey()
  final dynamic targetBand;

  @override
  String toString() {
    return 'BloodGlucoseGraphBlocState(viewStatus: $viewStatus, graphViewData: $graphViewData, targetBand: $targetBand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodGlucoseGraphBlocStateImpl &&
            (identical(other.viewStatus, viewStatus) ||
                other.viewStatus == viewStatus) &&
            (identical(other.graphViewData, graphViewData) ||
                other.graphViewData == graphViewData) &&
            const DeepCollectionEquality()
                .equals(other.targetBand, targetBand));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewStatus, graphViewData,
      const DeepCollectionEquality().hash(targetBand));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodGlucoseGraphBlocStateImplCopyWith<_$BloodGlucoseGraphBlocStateImpl>
      get copyWith => __$$BloodGlucoseGraphBlocStateImplCopyWithImpl<
          _$BloodGlucoseGraphBlocStateImpl>(this, _$identity);
}

abstract class _BloodGlucoseGraphBlocState extends BloodGlucoseGraphBlocState {
  const factory _BloodGlucoseGraphBlocState(
      {final ViewStatus viewStatus,
      final GraphViewData graphViewData,
      final dynamic targetBand}) = _$BloodGlucoseGraphBlocStateImpl;
  const _BloodGlucoseGraphBlocState._() : super._();

  @override
  ViewStatus get viewStatus;
  @override
  GraphViewData get graphViewData;
  @override
  dynamic get targetBand;
  @override
  @JsonKey(ignore: true)
  _$$BloodGlucoseGraphBlocStateImplCopyWith<_$BloodGlucoseGraphBlocStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
