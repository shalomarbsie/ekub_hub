// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contribution_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContributionRecord {

 String get id; String get equbId; String get cyclePeriodId; String get memberId; String get memberName; double get declaredAmount; String? get note; ContributionStatus get status; DateTime get submittedAt; String? get reviewerId; DateTime? get reviewedAt; String? get rejectionReason;
/// Create a copy of ContributionRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributionRecordCopyWith<ContributionRecord> get copyWith => _$ContributionRecordCopyWithImpl<ContributionRecord>(this as ContributionRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ContributionRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContributionRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.equbId, _this.equbId) || other.equbId == _this.equbId)&&(identical(other.cyclePeriodId, _this.cyclePeriodId) || other.cyclePeriodId == _this.cyclePeriodId)&&(identical(other.memberId, _this.memberId) || other.memberId == _this.memberId)&&(identical(other.memberName, _this.memberName) || other.memberName == _this.memberName)&&(identical(other.declaredAmount, _this.declaredAmount) || other.declaredAmount == _this.declaredAmount)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.submittedAt, _this.submittedAt) || other.submittedAt == _this.submittedAt)&&(identical(other.reviewerId, _this.reviewerId) || other.reviewerId == _this.reviewerId)&&(identical(other.reviewedAt, _this.reviewedAt) || other.reviewedAt == _this.reviewedAt)&&(identical(other.rejectionReason, _this.rejectionReason) || other.rejectionReason == _this.rejectionReason));
}


@override
int get hashCode {
  final _this = this as ContributionRecord;
  return Object.hash(runtimeType,_this.id,_this.equbId,_this.cyclePeriodId,_this.memberId,_this.memberName,_this.declaredAmount,_this.note,_this.status,_this.submittedAt,_this.reviewerId,_this.reviewedAt,_this.rejectionReason);
}

@override
String toString() {
  final _this = this as ContributionRecord;
  return 'ContributionRecord(id: ${_this.id}, equbId: ${_this.equbId}, cyclePeriodId: ${_this.cyclePeriodId}, memberId: ${_this.memberId}, memberName: ${_this.memberName}, declaredAmount: ${_this.declaredAmount}, note: ${_this.note}, status: ${_this.status}, submittedAt: ${_this.submittedAt}, reviewerId: ${_this.reviewerId}, reviewedAt: ${_this.reviewedAt}, rejectionReason: ${_this.rejectionReason})';
}


}

/// @nodoc
abstract mixin class $ContributionRecordCopyWith<$Res>  {
  factory $ContributionRecordCopyWith(ContributionRecord value, $Res Function(ContributionRecord) _then) = _$ContributionRecordCopyWithImpl;
@useResult
$Res call({
 String id, String equbId, String cyclePeriodId, String memberId, String memberName, double declaredAmount, String? note, ContributionStatus status, DateTime submittedAt, String? reviewerId, DateTime? reviewedAt, String? rejectionReason
});




}
/// @nodoc
class _$ContributionRecordCopyWithImpl<$Res>
    implements $ContributionRecordCopyWith<$Res> {
  _$ContributionRecordCopyWithImpl(this._self, this._then);

  final ContributionRecord _self;
  final $Res Function(ContributionRecord) _then;

/// Create a copy of ContributionRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? equbId = null,Object? cyclePeriodId = null,Object? memberId = null,Object? memberName = null,Object? declaredAmount = null,Object? note = freezed,Object? status = null,Object? submittedAt = null,Object? reviewerId = freezed,Object? reviewedAt = freezed,Object? rejectionReason = freezed,}) {
  return _then(ContributionRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,cyclePeriodId: null == cyclePeriodId ? _self.cyclePeriodId : cyclePeriodId // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,memberName: null == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String,declaredAmount: null == declaredAmount ? _self.declaredAmount : declaredAmount // ignore: cast_nullable_to_non_nullable
as double,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContributionStatus,submittedAt: null == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime,reviewerId: freezed == reviewerId ? _self.reviewerId : reviewerId // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContributionRecord].
extension ContributionRecordPatterns on ContributionRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContributionRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContributionRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContributionRecord value)  $default,){
final _that = this;
switch (_that) {
case _ContributionRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContributionRecord value)?  $default,){
final _that = this;
switch (_that) {
case _ContributionRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String equbId,  String cyclePeriodId,  String memberId,  String memberName,  double declaredAmount,  String? note,  ContributionStatus status,  DateTime submittedAt,  String? reviewerId,  DateTime? reviewedAt,  String? rejectionReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContributionRecord() when $default != null:
return $default(_that.id,_that.equbId,_that.cyclePeriodId,_that.memberId,_that.memberName,_that.declaredAmount,_that.note,_that.status,_that.submittedAt,_that.reviewerId,_that.reviewedAt,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String equbId,  String cyclePeriodId,  String memberId,  String memberName,  double declaredAmount,  String? note,  ContributionStatus status,  DateTime submittedAt,  String? reviewerId,  DateTime? reviewedAt,  String? rejectionReason)  $default,) {final _that = this;
switch (_that) {
case _ContributionRecord():
return $default(_that.id,_that.equbId,_that.cyclePeriodId,_that.memberId,_that.memberName,_that.declaredAmount,_that.note,_that.status,_that.submittedAt,_that.reviewerId,_that.reviewedAt,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String equbId,  String cyclePeriodId,  String memberId,  String memberName,  double declaredAmount,  String? note,  ContributionStatus status,  DateTime submittedAt,  String? reviewerId,  DateTime? reviewedAt,  String? rejectionReason)?  $default,) {final _that = this;
switch (_that) {
case _ContributionRecord() when $default != null:
return $default(_that.id,_that.equbId,_that.cyclePeriodId,_that.memberId,_that.memberName,_that.declaredAmount,_that.note,_that.status,_that.submittedAt,_that.reviewerId,_that.reviewedAt,_that.rejectionReason);case _:
  return null;

}
}

}

/// @nodoc


class _ContributionRecord implements ContributionRecord {
  const _ContributionRecord({required this.id, required this.equbId, required this.cyclePeriodId, required this.memberId, required this.memberName, required this.declaredAmount, this.note, required this.status, required this.submittedAt, this.reviewerId, this.reviewedAt, this.rejectionReason});
  

@override final  String id;
@override final  String equbId;
@override final  String cyclePeriodId;
@override final  String memberId;
@override final  String memberName;
@override final  double declaredAmount;
@override final  String? note;
@override final  ContributionStatus status;
@override final  DateTime submittedAt;
@override final  String? reviewerId;
@override final  DateTime? reviewedAt;
@override final  String? rejectionReason;

/// Create a copy of ContributionRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContributionRecordCopyWith<_ContributionRecord> get copyWith => __$ContributionRecordCopyWithImpl<_ContributionRecord>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContributionRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.equbId, equbId) || other.equbId == equbId)&&(identical(other.cyclePeriodId, cyclePeriodId) || other.cyclePeriodId == cyclePeriodId)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.memberName, memberName) || other.memberName == memberName)&&(identical(other.declaredAmount, declaredAmount) || other.declaredAmount == declaredAmount)&&(identical(other.note, note) || other.note == note)&&(identical(other.status, status) || other.status == status)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.reviewerId, reviewerId) || other.reviewerId == reviewerId)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,equbId,cyclePeriodId,memberId,memberName,declaredAmount,note,status,submittedAt,reviewerId,reviewedAt,rejectionReason);
}

@override
String toString() {
    return 'ContributionRecord(id: $id, equbId: $equbId, cyclePeriodId: $cyclePeriodId, memberId: $memberId, memberName: $memberName, declaredAmount: $declaredAmount, note: $note, status: $status, submittedAt: $submittedAt, reviewerId: $reviewerId, reviewedAt: $reviewedAt, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class _$ContributionRecordCopyWith<$Res> implements $ContributionRecordCopyWith<$Res> {
  factory _$ContributionRecordCopyWith(_ContributionRecord value, $Res Function(_ContributionRecord) _then) = __$ContributionRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String equbId, String cyclePeriodId, String memberId, String memberName, double declaredAmount, String? note, ContributionStatus status, DateTime submittedAt, String? reviewerId, DateTime? reviewedAt, String? rejectionReason
});




}
/// @nodoc
class __$ContributionRecordCopyWithImpl<$Res>
    implements _$ContributionRecordCopyWith<$Res> {
  __$ContributionRecordCopyWithImpl(this._self, this._then);

  final _ContributionRecord _self;
  final $Res Function(_ContributionRecord) _then;

/// Create a copy of ContributionRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? equbId = null,Object? cyclePeriodId = null,Object? memberId = null,Object? memberName = null,Object? declaredAmount = null,Object? note = freezed,Object? status = null,Object? submittedAt = null,Object? reviewerId = freezed,Object? reviewedAt = freezed,Object? rejectionReason = freezed,}) {
  return _then(_ContributionRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,cyclePeriodId: null == cyclePeriodId ? _self.cyclePeriodId : cyclePeriodId // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,memberName: null == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String,declaredAmount: null == declaredAmount ? _self.declaredAmount : declaredAmount // ignore: cast_nullable_to_non_nullable
as double,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ContributionStatus,submittedAt: null == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime,reviewerId: freezed == reviewerId ? _self.reviewerId : reviewerId // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ContributionRoundContext {

 String get equbId; String get equbTitle; String get roundId; int get roundNumber; int get totalRounds; double get defaultAmount; String get frequencyLabel; String get dueDateLabel; bool get isOpen;
/// Create a copy of ContributionRoundContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributionRoundContextCopyWith<ContributionRoundContext> get copyWith => _$ContributionRoundContextCopyWithImpl<ContributionRoundContext>(this as ContributionRoundContext, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ContributionRoundContext;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContributionRoundContext&&(identical(other.equbId, _this.equbId) || other.equbId == _this.equbId)&&(identical(other.equbTitle, _this.equbTitle) || other.equbTitle == _this.equbTitle)&&(identical(other.roundId, _this.roundId) || other.roundId == _this.roundId)&&(identical(other.roundNumber, _this.roundNumber) || other.roundNumber == _this.roundNumber)&&(identical(other.totalRounds, _this.totalRounds) || other.totalRounds == _this.totalRounds)&&(identical(other.defaultAmount, _this.defaultAmount) || other.defaultAmount == _this.defaultAmount)&&(identical(other.frequencyLabel, _this.frequencyLabel) || other.frequencyLabel == _this.frequencyLabel)&&(identical(other.dueDateLabel, _this.dueDateLabel) || other.dueDateLabel == _this.dueDateLabel)&&(identical(other.isOpen, _this.isOpen) || other.isOpen == _this.isOpen));
}


@override
int get hashCode {
  final _this = this as ContributionRoundContext;
  return Object.hash(runtimeType,_this.equbId,_this.equbTitle,_this.roundId,_this.roundNumber,_this.totalRounds,_this.defaultAmount,_this.frequencyLabel,_this.dueDateLabel,_this.isOpen);
}

@override
String toString() {
  final _this = this as ContributionRoundContext;
  return 'ContributionRoundContext(equbId: ${_this.equbId}, equbTitle: ${_this.equbTitle}, roundId: ${_this.roundId}, roundNumber: ${_this.roundNumber}, totalRounds: ${_this.totalRounds}, defaultAmount: ${_this.defaultAmount}, frequencyLabel: ${_this.frequencyLabel}, dueDateLabel: ${_this.dueDateLabel}, isOpen: ${_this.isOpen})';
}


}

/// @nodoc
abstract mixin class $ContributionRoundContextCopyWith<$Res>  {
  factory $ContributionRoundContextCopyWith(ContributionRoundContext value, $Res Function(ContributionRoundContext) _then) = _$ContributionRoundContextCopyWithImpl;
@useResult
$Res call({
 String equbId, String equbTitle, String roundId, int roundNumber, int totalRounds, double defaultAmount, String frequencyLabel, String dueDateLabel, bool isOpen
});




}
/// @nodoc
class _$ContributionRoundContextCopyWithImpl<$Res>
    implements $ContributionRoundContextCopyWith<$Res> {
  _$ContributionRoundContextCopyWithImpl(this._self, this._then);

  final ContributionRoundContext _self;
  final $Res Function(ContributionRoundContext) _then;

/// Create a copy of ContributionRoundContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? equbId = null,Object? equbTitle = null,Object? roundId = null,Object? roundNumber = null,Object? totalRounds = null,Object? defaultAmount = null,Object? frequencyLabel = null,Object? dueDateLabel = null,Object? isOpen = null,}) {
  return _then(ContributionRoundContext(
equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,equbTitle: null == equbTitle ? _self.equbTitle : equbTitle // ignore: cast_nullable_to_non_nullable
as String,roundId: null == roundId ? _self.roundId : roundId // ignore: cast_nullable_to_non_nullable
as String,roundNumber: null == roundNumber ? _self.roundNumber : roundNumber // ignore: cast_nullable_to_non_nullable
as int,totalRounds: null == totalRounds ? _self.totalRounds : totalRounds // ignore: cast_nullable_to_non_nullable
as int,defaultAmount: null == defaultAmount ? _self.defaultAmount : defaultAmount // ignore: cast_nullable_to_non_nullable
as double,frequencyLabel: null == frequencyLabel ? _self.frequencyLabel : frequencyLabel // ignore: cast_nullable_to_non_nullable
as String,dueDateLabel: null == dueDateLabel ? _self.dueDateLabel : dueDateLabel // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ContributionRoundContext].
extension ContributionRoundContextPatterns on ContributionRoundContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContributionRoundContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContributionRoundContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContributionRoundContext value)  $default,){
final _that = this;
switch (_that) {
case _ContributionRoundContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContributionRoundContext value)?  $default,){
final _that = this;
switch (_that) {
case _ContributionRoundContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String equbId,  String equbTitle,  String roundId,  int roundNumber,  int totalRounds,  double defaultAmount,  String frequencyLabel,  String dueDateLabel,  bool isOpen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContributionRoundContext() when $default != null:
return $default(_that.equbId,_that.equbTitle,_that.roundId,_that.roundNumber,_that.totalRounds,_that.defaultAmount,_that.frequencyLabel,_that.dueDateLabel,_that.isOpen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String equbId,  String equbTitle,  String roundId,  int roundNumber,  int totalRounds,  double defaultAmount,  String frequencyLabel,  String dueDateLabel,  bool isOpen)  $default,) {final _that = this;
switch (_that) {
case _ContributionRoundContext():
return $default(_that.equbId,_that.equbTitle,_that.roundId,_that.roundNumber,_that.totalRounds,_that.defaultAmount,_that.frequencyLabel,_that.dueDateLabel,_that.isOpen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String equbId,  String equbTitle,  String roundId,  int roundNumber,  int totalRounds,  double defaultAmount,  String frequencyLabel,  String dueDateLabel,  bool isOpen)?  $default,) {final _that = this;
switch (_that) {
case _ContributionRoundContext() when $default != null:
return $default(_that.equbId,_that.equbTitle,_that.roundId,_that.roundNumber,_that.totalRounds,_that.defaultAmount,_that.frequencyLabel,_that.dueDateLabel,_that.isOpen);case _:
  return null;

}
}

}

/// @nodoc


class _ContributionRoundContext implements ContributionRoundContext {
  const _ContributionRoundContext({required this.equbId, required this.equbTitle, required this.roundId, required this.roundNumber, required this.totalRounds, required this.defaultAmount, required this.frequencyLabel, required this.dueDateLabel, required this.isOpen});
  

@override final  String equbId;
@override final  String equbTitle;
@override final  String roundId;
@override final  int roundNumber;
@override final  int totalRounds;
@override final  double defaultAmount;
@override final  String frequencyLabel;
@override final  String dueDateLabel;
@override final  bool isOpen;

/// Create a copy of ContributionRoundContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContributionRoundContextCopyWith<_ContributionRoundContext> get copyWith => __$ContributionRoundContextCopyWithImpl<_ContributionRoundContext>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContributionRoundContext&&(identical(other.equbId, equbId) || other.equbId == equbId)&&(identical(other.equbTitle, equbTitle) || other.equbTitle == equbTitle)&&(identical(other.roundId, roundId) || other.roundId == roundId)&&(identical(other.roundNumber, roundNumber) || other.roundNumber == roundNumber)&&(identical(other.totalRounds, totalRounds) || other.totalRounds == totalRounds)&&(identical(other.defaultAmount, defaultAmount) || other.defaultAmount == defaultAmount)&&(identical(other.frequencyLabel, frequencyLabel) || other.frequencyLabel == frequencyLabel)&&(identical(other.dueDateLabel, dueDateLabel) || other.dueDateLabel == dueDateLabel)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen));
}


@override
int get hashCode {
    return Object.hash(runtimeType,equbId,equbTitle,roundId,roundNumber,totalRounds,defaultAmount,frequencyLabel,dueDateLabel,isOpen);
}

@override
String toString() {
    return 'ContributionRoundContext(equbId: $equbId, equbTitle: $equbTitle, roundId: $roundId, roundNumber: $roundNumber, totalRounds: $totalRounds, defaultAmount: $defaultAmount, frequencyLabel: $frequencyLabel, dueDateLabel: $dueDateLabel, isOpen: $isOpen)';
}


}

/// @nodoc
abstract mixin class _$ContributionRoundContextCopyWith<$Res> implements $ContributionRoundContextCopyWith<$Res> {
  factory _$ContributionRoundContextCopyWith(_ContributionRoundContext value, $Res Function(_ContributionRoundContext) _then) = __$ContributionRoundContextCopyWithImpl;
@override @useResult
$Res call({
 String equbId, String equbTitle, String roundId, int roundNumber, int totalRounds, double defaultAmount, String frequencyLabel, String dueDateLabel, bool isOpen
});




}
/// @nodoc
class __$ContributionRoundContextCopyWithImpl<$Res>
    implements _$ContributionRoundContextCopyWith<$Res> {
  __$ContributionRoundContextCopyWithImpl(this._self, this._then);

  final _ContributionRoundContext _self;
  final $Res Function(_ContributionRoundContext) _then;

/// Create a copy of ContributionRoundContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? equbId = null,Object? equbTitle = null,Object? roundId = null,Object? roundNumber = null,Object? totalRounds = null,Object? defaultAmount = null,Object? frequencyLabel = null,Object? dueDateLabel = null,Object? isOpen = null,}) {
  return _then(_ContributionRoundContext(
equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,equbTitle: null == equbTitle ? _self.equbTitle : equbTitle // ignore: cast_nullable_to_non_nullable
as String,roundId: null == roundId ? _self.roundId : roundId // ignore: cast_nullable_to_non_nullable
as String,roundNumber: null == roundNumber ? _self.roundNumber : roundNumber // ignore: cast_nullable_to_non_nullable
as int,totalRounds: null == totalRounds ? _self.totalRounds : totalRounds // ignore: cast_nullable_to_non_nullable
as int,defaultAmount: null == defaultAmount ? _self.defaultAmount : defaultAmount // ignore: cast_nullable_to_non_nullable
as double,frequencyLabel: null == frequencyLabel ? _self.frequencyLabel : frequencyLabel // ignore: cast_nullable_to_non_nullable
as String,dueDateLabel: null == dueDateLabel ? _self.dueDateLabel : dueDateLabel // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ContributionMemberSlot {

 String get memberId; String get memberName; String get userId; bool get isOrganizer;
/// Create a copy of ContributionMemberSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributionMemberSlotCopyWith<ContributionMemberSlot> get copyWith => _$ContributionMemberSlotCopyWithImpl<ContributionMemberSlot>(this as ContributionMemberSlot, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ContributionMemberSlot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContributionMemberSlot&&(identical(other.memberId, _this.memberId) || other.memberId == _this.memberId)&&(identical(other.memberName, _this.memberName) || other.memberName == _this.memberName)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.isOrganizer, _this.isOrganizer) || other.isOrganizer == _this.isOrganizer));
}


@override
int get hashCode {
  final _this = this as ContributionMemberSlot;
  return Object.hash(runtimeType,_this.memberId,_this.memberName,_this.userId,_this.isOrganizer);
}

@override
String toString() {
  final _this = this as ContributionMemberSlot;
  return 'ContributionMemberSlot(memberId: ${_this.memberId}, memberName: ${_this.memberName}, userId: ${_this.userId}, isOrganizer: ${_this.isOrganizer})';
}


}

/// @nodoc
abstract mixin class $ContributionMemberSlotCopyWith<$Res>  {
  factory $ContributionMemberSlotCopyWith(ContributionMemberSlot value, $Res Function(ContributionMemberSlot) _then) = _$ContributionMemberSlotCopyWithImpl;
@useResult
$Res call({
 String memberId, String memberName, String userId, bool isOrganizer
});




}
/// @nodoc
class _$ContributionMemberSlotCopyWithImpl<$Res>
    implements $ContributionMemberSlotCopyWith<$Res> {
  _$ContributionMemberSlotCopyWithImpl(this._self, this._then);

  final ContributionMemberSlot _self;
  final $Res Function(ContributionMemberSlot) _then;

/// Create a copy of ContributionMemberSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? memberId = null,Object? memberName = null,Object? userId = null,Object? isOrganizer = null,}) {
  return _then(ContributionMemberSlot(
memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,memberName: null == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isOrganizer: null == isOrganizer ? _self.isOrganizer : isOrganizer // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ContributionMemberSlot].
extension ContributionMemberSlotPatterns on ContributionMemberSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContributionMemberSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContributionMemberSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContributionMemberSlot value)  $default,){
final _that = this;
switch (_that) {
case _ContributionMemberSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContributionMemberSlot value)?  $default,){
final _that = this;
switch (_that) {
case _ContributionMemberSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String memberId,  String memberName,  String userId,  bool isOrganizer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContributionMemberSlot() when $default != null:
return $default(_that.memberId,_that.memberName,_that.userId,_that.isOrganizer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String memberId,  String memberName,  String userId,  bool isOrganizer)  $default,) {final _that = this;
switch (_that) {
case _ContributionMemberSlot():
return $default(_that.memberId,_that.memberName,_that.userId,_that.isOrganizer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String memberId,  String memberName,  String userId,  bool isOrganizer)?  $default,) {final _that = this;
switch (_that) {
case _ContributionMemberSlot() when $default != null:
return $default(_that.memberId,_that.memberName,_that.userId,_that.isOrganizer);case _:
  return null;

}
}

}

/// @nodoc


class _ContributionMemberSlot implements ContributionMemberSlot {
  const _ContributionMemberSlot({required this.memberId, required this.memberName, required this.userId, this.isOrganizer = false});
  

@override final  String memberId;
@override final  String memberName;
@override final  String userId;
@override@JsonKey() final  bool isOrganizer;

/// Create a copy of ContributionMemberSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContributionMemberSlotCopyWith<_ContributionMemberSlot> get copyWith => __$ContributionMemberSlotCopyWithImpl<_ContributionMemberSlot>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContributionMemberSlot&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.memberName, memberName) || other.memberName == memberName)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isOrganizer, isOrganizer) || other.isOrganizer == isOrganizer));
}


@override
int get hashCode {
    return Object.hash(runtimeType,memberId,memberName,userId,isOrganizer);
}

@override
String toString() {
    return 'ContributionMemberSlot(memberId: $memberId, memberName: $memberName, userId: $userId, isOrganizer: $isOrganizer)';
}


}

/// @nodoc
abstract mixin class _$ContributionMemberSlotCopyWith<$Res> implements $ContributionMemberSlotCopyWith<$Res> {
  factory _$ContributionMemberSlotCopyWith(_ContributionMemberSlot value, $Res Function(_ContributionMemberSlot) _then) = __$ContributionMemberSlotCopyWithImpl;
@override @useResult
$Res call({
 String memberId, String memberName, String userId, bool isOrganizer
});




}
/// @nodoc
class __$ContributionMemberSlotCopyWithImpl<$Res>
    implements _$ContributionMemberSlotCopyWith<$Res> {
  __$ContributionMemberSlotCopyWithImpl(this._self, this._then);

  final _ContributionMemberSlot _self;
  final $Res Function(_ContributionMemberSlot) _then;

/// Create a copy of ContributionMemberSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? memberId = null,Object? memberName = null,Object? userId = null,Object? isOrganizer = null,}) {
  return _then(_ContributionMemberSlot(
memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,memberName: null == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isOrganizer: null == isOrganizer ? _self.isOrganizer : isOrganizer // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$RoundRosterStatus {

 List<ContributionRecord> get records; List<ContributionMemberSlot> get notSubmittedMembers; int get totalMembers;
/// Create a copy of RoundRosterStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundRosterStatusCopyWith<RoundRosterStatus> get copyWith => _$RoundRosterStatusCopyWithImpl<RoundRosterStatus>(this as RoundRosterStatus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RoundRosterStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundRosterStatus&&const DeepCollectionEquality().equals(other.records, _this.records)&&const DeepCollectionEquality().equals(other.notSubmittedMembers, _this.notSubmittedMembers)&&(identical(other.totalMembers, _this.totalMembers) || other.totalMembers == _this.totalMembers));
}


@override
int get hashCode {
  final _this = this as RoundRosterStatus;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.records),const DeepCollectionEquality().hash(_this.notSubmittedMembers),_this.totalMembers);
}

@override
String toString() {
  final _this = this as RoundRosterStatus;
  return 'RoundRosterStatus(records: ${_this.records}, notSubmittedMembers: ${_this.notSubmittedMembers}, totalMembers: ${_this.totalMembers})';
}


}

/// @nodoc
abstract mixin class $RoundRosterStatusCopyWith<$Res>  {
  factory $RoundRosterStatusCopyWith(RoundRosterStatus value, $Res Function(RoundRosterStatus) _then) = _$RoundRosterStatusCopyWithImpl;
@useResult
$Res call({
 List<ContributionRecord> records, List<ContributionMemberSlot> notSubmittedMembers, int totalMembers
});




}
/// @nodoc
class _$RoundRosterStatusCopyWithImpl<$Res>
    implements $RoundRosterStatusCopyWith<$Res> {
  _$RoundRosterStatusCopyWithImpl(this._self, this._then);

  final RoundRosterStatus _self;
  final $Res Function(RoundRosterStatus) _then;

/// Create a copy of RoundRosterStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? records = null,Object? notSubmittedMembers = null,Object? totalMembers = null,}) {
  return _then(RoundRosterStatus(
records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<ContributionRecord>,notSubmittedMembers: null == notSubmittedMembers ? _self.notSubmittedMembers : notSubmittedMembers // ignore: cast_nullable_to_non_nullable
as List<ContributionMemberSlot>,totalMembers: null == totalMembers ? _self.totalMembers : totalMembers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RoundRosterStatus].
extension RoundRosterStatusPatterns on RoundRosterStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoundRosterStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoundRosterStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoundRosterStatus value)  $default,){
final _that = this;
switch (_that) {
case _RoundRosterStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoundRosterStatus value)?  $default,){
final _that = this;
switch (_that) {
case _RoundRosterStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContributionRecord> records,  List<ContributionMemberSlot> notSubmittedMembers,  int totalMembers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoundRosterStatus() when $default != null:
return $default(_that.records,_that.notSubmittedMembers,_that.totalMembers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContributionRecord> records,  List<ContributionMemberSlot> notSubmittedMembers,  int totalMembers)  $default,) {final _that = this;
switch (_that) {
case _RoundRosterStatus():
return $default(_that.records,_that.notSubmittedMembers,_that.totalMembers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContributionRecord> records,  List<ContributionMemberSlot> notSubmittedMembers,  int totalMembers)?  $default,) {final _that = this;
switch (_that) {
case _RoundRosterStatus() when $default != null:
return $default(_that.records,_that.notSubmittedMembers,_that.totalMembers);case _:
  return null;

}
}

}

/// @nodoc


class _RoundRosterStatus extends RoundRosterStatus {
  const _RoundRosterStatus({required  List<ContributionRecord> records, required  List<ContributionMemberSlot> notSubmittedMembers, required this.totalMembers}): _records = records,_notSubmittedMembers = notSubmittedMembers,super._();
  

 final  List<ContributionRecord> _records;
@override List<ContributionRecord> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}

 final  List<ContributionMemberSlot> _notSubmittedMembers;
@override List<ContributionMemberSlot> get notSubmittedMembers {
  if (_notSubmittedMembers is EqualUnmodifiableListView) return _notSubmittedMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notSubmittedMembers);
}

@override final  int totalMembers;

/// Create a copy of RoundRosterStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoundRosterStatusCopyWith<_RoundRosterStatus> get copyWith => __$RoundRosterStatusCopyWithImpl<_RoundRosterStatus>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoundRosterStatus&&const DeepCollectionEquality().equals(other.records, _records)&&const DeepCollectionEquality().equals(other.notSubmittedMembers, _notSubmittedMembers)&&(identical(other.totalMembers, totalMembers) || other.totalMembers == totalMembers));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_records),const DeepCollectionEquality().hash(_notSubmittedMembers),totalMembers);
}

@override
String toString() {
    return 'RoundRosterStatus(records: $records, notSubmittedMembers: $notSubmittedMembers, totalMembers: $totalMembers)';
}


}

/// @nodoc
abstract mixin class _$RoundRosterStatusCopyWith<$Res> implements $RoundRosterStatusCopyWith<$Res> {
  factory _$RoundRosterStatusCopyWith(_RoundRosterStatus value, $Res Function(_RoundRosterStatus) _then) = __$RoundRosterStatusCopyWithImpl;
@override @useResult
$Res call({
 List<ContributionRecord> records, List<ContributionMemberSlot> notSubmittedMembers, int totalMembers
});




}
/// @nodoc
class __$RoundRosterStatusCopyWithImpl<$Res>
    implements _$RoundRosterStatusCopyWith<$Res> {
  __$RoundRosterStatusCopyWithImpl(this._self, this._then);

  final _RoundRosterStatus _self;
  final $Res Function(_RoundRosterStatus) _then;

/// Create a copy of RoundRosterStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? records = null,Object? notSubmittedMembers = null,Object? totalMembers = null,}) {
  return _then(_RoundRosterStatus(
records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<ContributionRecord>,notSubmittedMembers: null == notSubmittedMembers ? _self._notSubmittedMembers : notSubmittedMembers // ignore: cast_nullable_to_non_nullable
as List<ContributionMemberSlot>,totalMembers: null == totalMembers ? _self.totalMembers : totalMembers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
