// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Membership {

 String get id; String get equbId; String get userId; MembershipRole get role; MembershipStatus get status; DateTime? get joinedAt;
/// Create a copy of Membership
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MembershipCopyWith<Membership> get copyWith => _$MembershipCopyWithImpl<Membership>(this as Membership, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Membership;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Membership&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.equbId, _this.equbId) || other.equbId == _this.equbId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.joinedAt, _this.joinedAt) || other.joinedAt == _this.joinedAt));
}


@override
int get hashCode {
  final _this = this as Membership;
  return Object.hash(runtimeType,_this.id,_this.equbId,_this.userId,_this.role,_this.status,_this.joinedAt);
}

@override
String toString() {
  final _this = this as Membership;
  return 'Membership(id: ${_this.id}, equbId: ${_this.equbId}, userId: ${_this.userId}, role: ${_this.role}, status: ${_this.status}, joinedAt: ${_this.joinedAt})';
}


}

/// @nodoc
abstract mixin class $MembershipCopyWith<$Res>  {
  factory $MembershipCopyWith(Membership value, $Res Function(Membership) _then) = _$MembershipCopyWithImpl;
@useResult
$Res call({
 String id, String equbId, String userId, MembershipRole role, MembershipStatus status, DateTime? joinedAt
});




}
/// @nodoc
class _$MembershipCopyWithImpl<$Res>
    implements $MembershipCopyWith<$Res> {
  _$MembershipCopyWithImpl(this._self, this._then);

  final Membership _self;
  final $Res Function(Membership) _then;

/// Create a copy of Membership
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? equbId = null,Object? userId = null,Object? role = null,Object? status = null,Object? joinedAt = freezed,}) {
  return _then(Membership(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MembershipRole,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MembershipStatus,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Membership].
extension MembershipPatterns on Membership {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Membership value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Membership() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Membership value)  $default,){
final _that = this;
switch (_that) {
case _Membership():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Membership value)?  $default,){
final _that = this;
switch (_that) {
case _Membership() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String equbId,  String userId,  MembershipRole role,  MembershipStatus status,  DateTime? joinedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Membership() when $default != null:
return $default(_that.id,_that.equbId,_that.userId,_that.role,_that.status,_that.joinedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String equbId,  String userId,  MembershipRole role,  MembershipStatus status,  DateTime? joinedAt)  $default,) {final _that = this;
switch (_that) {
case _Membership():
return $default(_that.id,_that.equbId,_that.userId,_that.role,_that.status,_that.joinedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String equbId,  String userId,  MembershipRole role,  MembershipStatus status,  DateTime? joinedAt)?  $default,) {final _that = this;
switch (_that) {
case _Membership() when $default != null:
return $default(_that.id,_that.equbId,_that.userId,_that.role,_that.status,_that.joinedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Membership implements Membership {
  const _Membership({required this.id, required this.equbId, required this.userId, required this.role, required this.status, this.joinedAt});
  

@override final  String id;
@override final  String equbId;
@override final  String userId;
@override final  MembershipRole role;
@override final  MembershipStatus status;
@override final  DateTime? joinedAt;

/// Create a copy of Membership
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MembershipCopyWith<_Membership> get copyWith => __$MembershipCopyWithImpl<_Membership>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Membership&&(identical(other.id, id) || other.id == id)&&(identical(other.equbId, equbId) || other.equbId == equbId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,equbId,userId,role,status,joinedAt);
}

@override
String toString() {
    return 'Membership(id: $id, equbId: $equbId, userId: $userId, role: $role, status: $status, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class _$MembershipCopyWith<$Res> implements $MembershipCopyWith<$Res> {
  factory _$MembershipCopyWith(_Membership value, $Res Function(_Membership) _then) = __$MembershipCopyWithImpl;
@override @useResult
$Res call({
 String id, String equbId, String userId, MembershipRole role, MembershipStatus status, DateTime? joinedAt
});




}
/// @nodoc
class __$MembershipCopyWithImpl<$Res>
    implements _$MembershipCopyWith<$Res> {
  __$MembershipCopyWithImpl(this._self, this._then);

  final _Membership _self;
  final $Res Function(_Membership) _then;

/// Create a copy of Membership
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? equbId = null,Object? userId = null,Object? role = null,Object? status = null,Object? joinedAt = freezed,}) {
  return _then(_Membership(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MembershipRole,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MembershipStatus,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
