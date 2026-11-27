// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle_period.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CyclePeriod {

 String get id; String get equbId; int get periodNumber; DateTime get deadline; CyclePeriodStatus get status; String? get winnerMemberId;
/// Create a copy of CyclePeriod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CyclePeriodCopyWith<CyclePeriod> get copyWith => _$CyclePeriodCopyWithImpl<CyclePeriod>(this as CyclePeriod, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CyclePeriod;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CyclePeriod&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.equbId, _this.equbId) || other.equbId == _this.equbId)&&(identical(other.periodNumber, _this.periodNumber) || other.periodNumber == _this.periodNumber)&&(identical(other.deadline, _this.deadline) || other.deadline == _this.deadline)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.winnerMemberId, _this.winnerMemberId) || other.winnerMemberId == _this.winnerMemberId));
}


@override
int get hashCode {
  final _this = this as CyclePeriod;
  return Object.hash(runtimeType,_this.id,_this.equbId,_this.periodNumber,_this.deadline,_this.status,_this.winnerMemberId);
}

@override
String toString() {
  final _this = this as CyclePeriod;
  return 'CyclePeriod(id: ${_this.id}, equbId: ${_this.equbId}, periodNumber: ${_this.periodNumber}, deadline: ${_this.deadline}, status: ${_this.status}, winnerMemberId: ${_this.winnerMemberId})';
}


}

/// @nodoc
abstract mixin class $CyclePeriodCopyWith<$Res>  {
  factory $CyclePeriodCopyWith(CyclePeriod value, $Res Function(CyclePeriod) _then) = _$CyclePeriodCopyWithImpl;
@useResult
$Res call({
 String id, String equbId, int periodNumber, DateTime deadline, CyclePeriodStatus status, String? winnerMemberId
});




}
/// @nodoc
class _$CyclePeriodCopyWithImpl<$Res>
    implements $CyclePeriodCopyWith<$Res> {
  _$CyclePeriodCopyWithImpl(this._self, this._then);

  final CyclePeriod _self;
  final $Res Function(CyclePeriod) _then;

/// Create a copy of CyclePeriod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? equbId = null,Object? periodNumber = null,Object? deadline = null,Object? status = null,Object? winnerMemberId = freezed,}) {
  return _then(CyclePeriod(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,periodNumber: null == periodNumber ? _self.periodNumber : periodNumber // ignore: cast_nullable_to_non_nullable
as int,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CyclePeriodStatus,winnerMemberId: freezed == winnerMemberId ? _self.winnerMemberId : winnerMemberId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CyclePeriod].
extension CyclePeriodPatterns on CyclePeriod {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CyclePeriod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CyclePeriod() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CyclePeriod value)  $default,){
final _that = this;
switch (_that) {
case _CyclePeriod():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CyclePeriod value)?  $default,){
final _that = this;
switch (_that) {
case _CyclePeriod() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String equbId,  int periodNumber,  DateTime deadline,  CyclePeriodStatus status,  String? winnerMemberId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CyclePeriod() when $default != null:
return $default(_that.id,_that.equbId,_that.periodNumber,_that.deadline,_that.status,_that.winnerMemberId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String equbId,  int periodNumber,  DateTime deadline,  CyclePeriodStatus status,  String? winnerMemberId)  $default,) {final _that = this;
switch (_that) {
case _CyclePeriod():
return $default(_that.id,_that.equbId,_that.periodNumber,_that.deadline,_that.status,_that.winnerMemberId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String equbId,  int periodNumber,  DateTime deadline,  CyclePeriodStatus status,  String? winnerMemberId)?  $default,) {final _that = this;
switch (_that) {
case _CyclePeriod() when $default != null:
return $default(_that.id,_that.equbId,_that.periodNumber,_that.deadline,_that.status,_that.winnerMemberId);case _:
  return null;

}
}

}

/// @nodoc


class _CyclePeriod implements CyclePeriod {
  const _CyclePeriod({required this.id, required this.equbId, required this.periodNumber, required this.deadline, required this.status, this.winnerMemberId});
  

@override final  String id;
@override final  String equbId;
@override final  int periodNumber;
@override final  DateTime deadline;
@override final  CyclePeriodStatus status;
@override final  String? winnerMemberId;

/// Create a copy of CyclePeriod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CyclePeriodCopyWith<_CyclePeriod> get copyWith => __$CyclePeriodCopyWithImpl<_CyclePeriod>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CyclePeriod&&(identical(other.id, id) || other.id == id)&&(identical(other.equbId, equbId) || other.equbId == equbId)&&(identical(other.periodNumber, periodNumber) || other.periodNumber == periodNumber)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.status, status) || other.status == status)&&(identical(other.winnerMemberId, winnerMemberId) || other.winnerMemberId == winnerMemberId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,equbId,periodNumber,deadline,status,winnerMemberId);
}

@override
String toString() {
    return 'CyclePeriod(id: $id, equbId: $equbId, periodNumber: $periodNumber, deadline: $deadline, status: $status, winnerMemberId: $winnerMemberId)';
}


}

/// @nodoc
abstract mixin class _$CyclePeriodCopyWith<$Res> implements $CyclePeriodCopyWith<$Res> {
  factory _$CyclePeriodCopyWith(_CyclePeriod value, $Res Function(_CyclePeriod) _then) = __$CyclePeriodCopyWithImpl;
@override @useResult
$Res call({
 String id, String equbId, int periodNumber, DateTime deadline, CyclePeriodStatus status, String? winnerMemberId
});




}
/// @nodoc
class __$CyclePeriodCopyWithImpl<$Res>
    implements _$CyclePeriodCopyWith<$Res> {
  __$CyclePeriodCopyWithImpl(this._self, this._then);

  final _CyclePeriod _self;
  final $Res Function(_CyclePeriod) _then;

/// Create a copy of CyclePeriod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? equbId = null,Object? periodNumber = null,Object? deadline = null,Object? status = null,Object? winnerMemberId = freezed,}) {
  return _then(_CyclePeriod(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,periodNumber: null == periodNumber ? _self.periodNumber : periodNumber // ignore: cast_nullable_to_non_nullable
as int,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CyclePeriodStatus,winnerMemberId: freezed == winnerMemberId ? _self.winnerMemberId : winnerMemberId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
