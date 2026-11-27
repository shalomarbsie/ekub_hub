// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equb_roster_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EqubRosterEntry {

 String get membershipId; String get userId; String get displayName; MembershipRole get role; ContributionStatus get contributionStatus;
/// Create a copy of EqubRosterEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EqubRosterEntryCopyWith<EqubRosterEntry> get copyWith => _$EqubRosterEntryCopyWithImpl<EqubRosterEntry>(this as EqubRosterEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EqubRosterEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EqubRosterEntry&&(identical(other.membershipId, _this.membershipId) || other.membershipId == _this.membershipId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.contributionStatus, _this.contributionStatus) || other.contributionStatus == _this.contributionStatus));
}


@override
int get hashCode {
  final _this = this as EqubRosterEntry;
  return Object.hash(runtimeType,_this.membershipId,_this.userId,_this.displayName,_this.role,_this.contributionStatus);
}

@override
String toString() {
  final _this = this as EqubRosterEntry;
  return 'EqubRosterEntry(membershipId: ${_this.membershipId}, userId: ${_this.userId}, displayName: ${_this.displayName}, role: ${_this.role}, contributionStatus: ${_this.contributionStatus})';
}


}

/// @nodoc
abstract mixin class $EqubRosterEntryCopyWith<$Res>  {
  factory $EqubRosterEntryCopyWith(EqubRosterEntry value, $Res Function(EqubRosterEntry) _then) = _$EqubRosterEntryCopyWithImpl;
@useResult
$Res call({
 String membershipId, String userId, String displayName, MembershipRole role, ContributionStatus contributionStatus
});




}
/// @nodoc
class _$EqubRosterEntryCopyWithImpl<$Res>
    implements $EqubRosterEntryCopyWith<$Res> {
  _$EqubRosterEntryCopyWithImpl(this._self, this._then);

  final EqubRosterEntry _self;
  final $Res Function(EqubRosterEntry) _then;

/// Create a copy of EqubRosterEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? membershipId = null,Object? userId = null,Object? displayName = null,Object? role = null,Object? contributionStatus = null,}) {
  return _then(EqubRosterEntry(
membershipId: null == membershipId ? _self.membershipId : membershipId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MembershipRole,contributionStatus: null == contributionStatus ? _self.contributionStatus : contributionStatus // ignore: cast_nullable_to_non_nullable
as ContributionStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [EqubRosterEntry].
extension EqubRosterEntryPatterns on EqubRosterEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EqubRosterEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EqubRosterEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EqubRosterEntry value)  $default,){
final _that = this;
switch (_that) {
case _EqubRosterEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EqubRosterEntry value)?  $default,){
final _that = this;
switch (_that) {
case _EqubRosterEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String membershipId,  String userId,  String displayName,  MembershipRole role,  ContributionStatus contributionStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EqubRosterEntry() when $default != null:
return $default(_that.membershipId,_that.userId,_that.displayName,_that.role,_that.contributionStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String membershipId,  String userId,  String displayName,  MembershipRole role,  ContributionStatus contributionStatus)  $default,) {final _that = this;
switch (_that) {
case _EqubRosterEntry():
return $default(_that.membershipId,_that.userId,_that.displayName,_that.role,_that.contributionStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String membershipId,  String userId,  String displayName,  MembershipRole role,  ContributionStatus contributionStatus)?  $default,) {final _that = this;
switch (_that) {
case _EqubRosterEntry() when $default != null:
return $default(_that.membershipId,_that.userId,_that.displayName,_that.role,_that.contributionStatus);case _:
  return null;

}
}

}

/// @nodoc


class _EqubRosterEntry implements EqubRosterEntry {
  const _EqubRosterEntry({required this.membershipId, required this.userId, required this.displayName, required this.role, required this.contributionStatus});
  

@override final  String membershipId;
@override final  String userId;
@override final  String displayName;
@override final  MembershipRole role;
@override final  ContributionStatus contributionStatus;

/// Create a copy of EqubRosterEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EqubRosterEntryCopyWith<_EqubRosterEntry> get copyWith => __$EqubRosterEntryCopyWithImpl<_EqubRosterEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EqubRosterEntry&&(identical(other.membershipId, membershipId) || other.membershipId == membershipId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&(identical(other.contributionStatus, contributionStatus) || other.contributionStatus == contributionStatus));
}


@override
int get hashCode {
    return Object.hash(runtimeType,membershipId,userId,displayName,role,contributionStatus);
}

@override
String toString() {
    return 'EqubRosterEntry(membershipId: $membershipId, userId: $userId, displayName: $displayName, role: $role, contributionStatus: $contributionStatus)';
}


}

/// @nodoc
abstract mixin class _$EqubRosterEntryCopyWith<$Res> implements $EqubRosterEntryCopyWith<$Res> {
  factory _$EqubRosterEntryCopyWith(_EqubRosterEntry value, $Res Function(_EqubRosterEntry) _then) = __$EqubRosterEntryCopyWithImpl;
@override @useResult
$Res call({
 String membershipId, String userId, String displayName, MembershipRole role, ContributionStatus contributionStatus
});




}
/// @nodoc
class __$EqubRosterEntryCopyWithImpl<$Res>
    implements _$EqubRosterEntryCopyWith<$Res> {
  __$EqubRosterEntryCopyWithImpl(this._self, this._then);

  final _EqubRosterEntry _self;
  final $Res Function(_EqubRosterEntry) _then;

/// Create a copy of EqubRosterEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? membershipId = null,Object? userId = null,Object? displayName = null,Object? role = null,Object? contributionStatus = null,}) {
  return _then(_EqubRosterEntry(
membershipId: null == membershipId ? _self.membershipId : membershipId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MembershipRole,contributionStatus: null == contributionStatus ? _self.contributionStatus : contributionStatus // ignore: cast_nullable_to_non_nullable
as ContributionStatus,
  ));
}


}

// dart format on
