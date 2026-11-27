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

 String get id; String get equbId; String get cyclePeriodId; String get memberId; double get declaredAmount; String? get note; ContributionStatus get status; DateTime get submittedAt; String? get reviewerId; DateTime? get reviewedAt; String? get rejectionReason;
/// Create a copy of ContributionRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributionRecordCopyWith<ContributionRecord> get copyWith => _$ContributionRecordCopyWithImpl<ContributionRecord>(this as ContributionRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ContributionRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContributionRecord&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.equbId, _this.equbId) || other.equbId == _this.equbId)&&(identical(other.cyclePeriodId, _this.cyclePeriodId) || other.cyclePeriodId == _this.cyclePeriodId)&&(identical(other.memberId, _this.memberId) || other.memberId == _this.memberId)&&(identical(other.declaredAmount, _this.declaredAmount) || other.declaredAmount == _this.declaredAmount)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.submittedAt, _this.submittedAt) || other.submittedAt == _this.submittedAt)&&(identical(other.reviewerId, _this.reviewerId) || other.reviewerId == _this.reviewerId)&&(identical(other.reviewedAt, _this.reviewedAt) || other.reviewedAt == _this.reviewedAt)&&(identical(other.rejectionReason, _this.rejectionReason) || other.rejectionReason == _this.rejectionReason));
}


@override
int get hashCode {
  final _this = this as ContributionRecord;
  return Object.hash(runtimeType,_this.id,_this.equbId,_this.cyclePeriodId,_this.memberId,_this.declaredAmount,_this.note,_this.status,_this.submittedAt,_this.reviewerId,_this.reviewedAt,_this.rejectionReason);
}

@override
String toString() {
  final _this = this as ContributionRecord;
  return 'ContributionRecord(id: ${_this.id}, equbId: ${_this.equbId}, cyclePeriodId: ${_this.cyclePeriodId}, memberId: ${_this.memberId}, declaredAmount: ${_this.declaredAmount}, note: ${_this.note}, status: ${_this.status}, submittedAt: ${_this.submittedAt}, reviewerId: ${_this.reviewerId}, reviewedAt: ${_this.reviewedAt}, rejectionReason: ${_this.rejectionReason})';
}


}

/// @nodoc
abstract mixin class $ContributionRecordCopyWith<$Res>  {
  factory $ContributionRecordCopyWith(ContributionRecord value, $Res Function(ContributionRecord) _then) = _$ContributionRecordCopyWithImpl;
@useResult
$Res call({
 String id, String equbId, String cyclePeriodId, String memberId, double declaredAmount, String? note, ContributionStatus status, DateTime submittedAt, String? reviewerId, DateTime? reviewedAt, String? rejectionReason
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? equbId = null,Object? cyclePeriodId = null,Object? memberId = null,Object? declaredAmount = null,Object? note = freezed,Object? status = null,Object? submittedAt = null,Object? reviewerId = freezed,Object? reviewedAt = freezed,Object? rejectionReason = freezed,}) {
  return _then(ContributionRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,cyclePeriodId: null == cyclePeriodId ? _self.cyclePeriodId : cyclePeriodId // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String equbId,  String cyclePeriodId,  String memberId,  double declaredAmount,  String? note,  ContributionStatus status,  DateTime submittedAt,  String? reviewerId,  DateTime? reviewedAt,  String? rejectionReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContributionRecord() when $default != null:
return $default(_that.id,_that.equbId,_that.cyclePeriodId,_that.memberId,_that.declaredAmount,_that.note,_that.status,_that.submittedAt,_that.reviewerId,_that.reviewedAt,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String equbId,  String cyclePeriodId,  String memberId,  double declaredAmount,  String? note,  ContributionStatus status,  DateTime submittedAt,  String? reviewerId,  DateTime? reviewedAt,  String? rejectionReason)  $default,) {final _that = this;
switch (_that) {
case _ContributionRecord():
return $default(_that.id,_that.equbId,_that.cyclePeriodId,_that.memberId,_that.declaredAmount,_that.note,_that.status,_that.submittedAt,_that.reviewerId,_that.reviewedAt,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String equbId,  String cyclePeriodId,  String memberId,  double declaredAmount,  String? note,  ContributionStatus status,  DateTime submittedAt,  String? reviewerId,  DateTime? reviewedAt,  String? rejectionReason)?  $default,) {final _that = this;
switch (_that) {
case _ContributionRecord() when $default != null:
return $default(_that.id,_that.equbId,_that.cyclePeriodId,_that.memberId,_that.declaredAmount,_that.note,_that.status,_that.submittedAt,_that.reviewerId,_that.reviewedAt,_that.rejectionReason);case _:
  return null;

}
}

}

/// @nodoc


class _ContributionRecord implements ContributionRecord {
  const _ContributionRecord({required this.id, required this.equbId, required this.cyclePeriodId, required this.memberId, required this.declaredAmount, this.note, required this.status, required this.submittedAt, this.reviewerId, this.reviewedAt, this.rejectionReason});


@override final  String id;
@override final  String equbId;
@override final  String cyclePeriodId;
@override final  String memberId;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContributionRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.equbId, equbId) || other.equbId == equbId)&&(identical(other.cyclePeriodId, cyclePeriodId) || other.cyclePeriodId == cyclePeriodId)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.declaredAmount, declaredAmount) || other.declaredAmount == declaredAmount)&&(identical(other.note, note) || other.note == note)&&(identical(other.status, status) || other.status == status)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.reviewerId, reviewerId) || other.reviewerId == reviewerId)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,equbId,cyclePeriodId,memberId,declaredAmount,note,status,submittedAt,reviewerId,reviewedAt,rejectionReason);
}

@override
String toString() {
    return 'ContributionRecord(id: $id, equbId: $equbId, cyclePeriodId: $cyclePeriodId, memberId: $memberId, declaredAmount: $declaredAmount, note: $note, status: $status, submittedAt: $submittedAt, reviewerId: $reviewerId, reviewedAt: $reviewedAt, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class _$ContributionRecordCopyWith<$Res> implements $ContributionRecordCopyWith<$Res> {
  factory _$ContributionRecordCopyWith(_ContributionRecord value, $Res Function(_ContributionRecord) _then) = __$ContributionRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String equbId, String cyclePeriodId, String memberId, double declaredAmount, String? note, ContributionStatus status, DateTime submittedAt, String? reviewerId, DateTime? reviewedAt, String? rejectionReason
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? equbId = null,Object? cyclePeriodId = null,Object? memberId = null,Object? declaredAmount = null,Object? note = freezed,Object? status = null,Object? submittedAt = null,Object? reviewerId = freezed,Object? reviewedAt = freezed,Object? rejectionReason = freezed,}) {
  return _then(_ContributionRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,cyclePeriodId: null == cyclePeriodId ? _self.cyclePeriodId : cyclePeriodId // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
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
mixin _$ContributionRosterEntry {

 Membership get membership; String get memberName; ContributionRecord? get record;
/// Create a copy of ContributionRosterEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContributionRosterEntryCopyWith<ContributionRosterEntry> get copyWith => _$ContributionRosterEntryCopyWithImpl<ContributionRosterEntry>(this as ContributionRosterEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ContributionRosterEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContributionRosterEntry&&(identical(other.membership, _this.membership) || other.membership == _this.membership)&&(identical(other.memberName, _this.memberName) || other.memberName == _this.memberName)&&(identical(other.record, _this.record) || other.record == _this.record));
}


@override
int get hashCode {
  final _this = this as ContributionRosterEntry;
  return Object.hash(runtimeType,_this.membership,_this.memberName,_this.record);
}

@override
String toString() {
  final _this = this as ContributionRosterEntry;
  return 'ContributionRosterEntry(membership: ${_this.membership}, memberName: ${_this.memberName}, record: ${_this.record})';
}


}

/// @nodoc
abstract mixin class $ContributionRosterEntryCopyWith<$Res>  {
  factory $ContributionRosterEntryCopyWith(ContributionRosterEntry value, $Res Function(ContributionRosterEntry) _then) = _$ContributionRosterEntryCopyWithImpl;
@useResult
$Res call({
 Membership membership, String memberName, ContributionRecord? record
});


$MembershipCopyWith<$Res> get membership;$ContributionRecordCopyWith<$Res>? get record;

}
/// @nodoc
class _$ContributionRosterEntryCopyWithImpl<$Res>
    implements $ContributionRosterEntryCopyWith<$Res> {
  _$ContributionRosterEntryCopyWithImpl(this._self, this._then);

  final ContributionRosterEntry _self;
  final $Res Function(ContributionRosterEntry) _then;

/// Create a copy of ContributionRosterEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? membership = null,Object? memberName = null,Object? record = freezed,}) {
  return _then(ContributionRosterEntry(
membership: null == membership ? _self.membership : membership // ignore: cast_nullable_to_non_nullable
as Membership,memberName: null == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String,record: freezed == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as ContributionRecord?,
  ));
}
/// Create a copy of ContributionRosterEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MembershipCopyWith<$Res> get membership {

  return $MembershipCopyWith<$Res>(_self.membership, (value) {
    return _then(_self.copyWith(membership: value));
  });
}/// Create a copy of ContributionRosterEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContributionRecordCopyWith<$Res>? get record {
    if (_self.record == null) {
    return null;
  }

  return $ContributionRecordCopyWith<$Res>(_self.record!, (value) {
    return _then(_self.copyWith(record: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContributionRosterEntry].
extension ContributionRosterEntryPatterns on ContributionRosterEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContributionRosterEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContributionRosterEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContributionRosterEntry value)  $default,){
final _that = this;
switch (_that) {
case _ContributionRosterEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContributionRosterEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ContributionRosterEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Membership membership,  String memberName,  ContributionRecord? record)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContributionRosterEntry() when $default != null:
return $default(_that.membership,_that.memberName,_that.record);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Membership membership,  String memberName,  ContributionRecord? record)  $default,) {final _that = this;
switch (_that) {
case _ContributionRosterEntry():
return $default(_that.membership,_that.memberName,_that.record);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Membership membership,  String memberName,  ContributionRecord? record)?  $default,) {final _that = this;
switch (_that) {
case _ContributionRosterEntry() when $default != null:
return $default(_that.membership,_that.memberName,_that.record);case _:
  return null;

}
}

}

/// @nodoc


class _ContributionRosterEntry implements ContributionRosterEntry {
  const _ContributionRosterEntry({required this.membership, required this.memberName, this.record});


@override final  Membership membership;
@override final  String memberName;
@override final  ContributionRecord? record;

/// Create a copy of ContributionRosterEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContributionRosterEntryCopyWith<_ContributionRosterEntry> get copyWith => __$ContributionRosterEntryCopyWithImpl<_ContributionRosterEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContributionRosterEntry&&(identical(other.membership, membership) || other.membership == membership)&&(identical(other.memberName, memberName) || other.memberName == memberName)&&(identical(other.record, record) || other.record == record));
}


@override
int get hashCode {
    return Object.hash(runtimeType,membership,memberName,record);
}

@override
String toString() {
    return 'ContributionRosterEntry(membership: $membership, memberName: $memberName, record: $record)';
}


}

/// @nodoc
abstract mixin class _$ContributionRosterEntryCopyWith<$Res> implements $ContributionRosterEntryCopyWith<$Res> {
  factory _$ContributionRosterEntryCopyWith(_ContributionRosterEntry value, $Res Function(_ContributionRosterEntry) _then) = __$ContributionRosterEntryCopyWithImpl;
@override @useResult
$Res call({
 Membership membership, String memberName, ContributionRecord? record
});


@override $MembershipCopyWith<$Res> get membership;@override $ContributionRecordCopyWith<$Res>? get record;

}
/// @nodoc
class __$ContributionRosterEntryCopyWithImpl<$Res>
    implements _$ContributionRosterEntryCopyWith<$Res> {
  __$ContributionRosterEntryCopyWithImpl(this._self, this._then);

  final _ContributionRosterEntry _self;
  final $Res Function(_ContributionRosterEntry) _then;

/// Create a copy of ContributionRosterEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? membership = null,Object? memberName = null,Object? record = freezed,}) {
  return _then(_ContributionRosterEntry(
membership: null == membership ? _self.membership : membership // ignore: cast_nullable_to_non_nullable
as Membership,memberName: null == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String,record: freezed == record ? _self.record : record // ignore: cast_nullable_to_non_nullable
as ContributionRecord?,
  ));
}

/// Create a copy of ContributionRosterEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MembershipCopyWith<$Res> get membership {

  return $MembershipCopyWith<$Res>(_self.membership, (value) {
    return _then(_self.copyWith(membership: value));
  });
}/// Create a copy of ContributionRosterEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContributionRecordCopyWith<$Res>? get record {
    if (_self.record == null) {
    return null;
  }

  return $ContributionRecordCopyWith<$Res>(_self.record!, (value) {
    return _then(_self.copyWith(record: value));
  });
}
}

/// @nodoc
mixin _$RoundRosterStatus {

 List<ContributionRosterEntry> get entries; int get totalMembers;
/// Create a copy of RoundRosterStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundRosterStatusCopyWith<RoundRosterStatus> get copyWith => _$RoundRosterStatusCopyWithImpl<RoundRosterStatus>(this as RoundRosterStatus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RoundRosterStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoundRosterStatus&&const DeepCollectionEquality().equals(other.entries, _this.entries)&&(identical(other.totalMembers, _this.totalMembers) || other.totalMembers == _this.totalMembers));
}


@override
int get hashCode {
  final _this = this as RoundRosterStatus;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.entries),_this.totalMembers);
}

@override
String toString() {
  final _this = this as RoundRosterStatus;
  return 'RoundRosterStatus(entries: ${_this.entries}, totalMembers: ${_this.totalMembers})';
}


}

/// @nodoc
abstract mixin class $RoundRosterStatusCopyWith<$Res>  {
  factory $RoundRosterStatusCopyWith(RoundRosterStatus value, $Res Function(RoundRosterStatus) _then) = _$RoundRosterStatusCopyWithImpl;
@useResult
$Res call({
 List<ContributionRosterEntry> entries, int totalMembers
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
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,Object? totalMembers = null,}) {
  return _then(RoundRosterStatus(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<ContributionRosterEntry>,totalMembers: null == totalMembers ? _self.totalMembers : totalMembers // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ContributionRosterEntry> entries,  int totalMembers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoundRosterStatus() when $default != null:
return $default(_that.entries,_that.totalMembers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ContributionRosterEntry> entries,  int totalMembers)  $default,) {final _that = this;
switch (_that) {
case _RoundRosterStatus():
return $default(_that.entries,_that.totalMembers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ContributionRosterEntry> entries,  int totalMembers)?  $default,) {final _that = this;
switch (_that) {
case _RoundRosterStatus() when $default != null:
return $default(_that.entries,_that.totalMembers);case _:
  return null;

}
}

}

/// @nodoc


class _RoundRosterStatus extends RoundRosterStatus {
  const _RoundRosterStatus({required  List<ContributionRosterEntry> entries, required this.totalMembers}): _entries = entries,super._();


 final  List<ContributionRosterEntry> _entries;
@override List<ContributionRosterEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override final  int totalMembers;

/// Create a copy of RoundRosterStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoundRosterStatusCopyWith<_RoundRosterStatus> get copyWith => __$RoundRosterStatusCopyWithImpl<_RoundRosterStatus>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoundRosterStatus&&const DeepCollectionEquality().equals(other.entries, _entries)&&(identical(other.totalMembers, totalMembers) || other.totalMembers == totalMembers));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries),totalMembers);
}

@override
String toString() {
    return 'RoundRosterStatus(entries: $entries, totalMembers: $totalMembers)';
}


}

/// @nodoc
abstract mixin class _$RoundRosterStatusCopyWith<$Res> implements $RoundRosterStatusCopyWith<$Res> {
  factory _$RoundRosterStatusCopyWith(_RoundRosterStatus value, $Res Function(_RoundRosterStatus) _then) = __$RoundRosterStatusCopyWithImpl;
@override @useResult
$Res call({
 List<ContributionRosterEntry> entries, int totalMembers
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
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,Object? totalMembers = null,}) {
  return _then(_RoundRosterStatus(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<ContributionRosterEntry>,totalMembers: null == totalMembers ? _self.totalMembers : totalMembers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
