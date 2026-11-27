// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Invitation {

 String get id; String get equbId; String get inviteCode; String get qrPayload;
/// Create a copy of Invitation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvitationCopyWith<Invitation> get copyWith => _$InvitationCopyWithImpl<Invitation>(this as Invitation, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Invitation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Invitation&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.equbId, _this.equbId) || other.equbId == _this.equbId)&&(identical(other.inviteCode, _this.inviteCode) || other.inviteCode == _this.inviteCode)&&(identical(other.qrPayload, _this.qrPayload) || other.qrPayload == _this.qrPayload));
}


@override
int get hashCode {
  final _this = this as Invitation;
  return Object.hash(runtimeType,_this.id,_this.equbId,_this.inviteCode,_this.qrPayload);
}

@override
String toString() {
  final _this = this as Invitation;
  return 'Invitation(id: ${_this.id}, equbId: ${_this.equbId}, inviteCode: ${_this.inviteCode}, qrPayload: ${_this.qrPayload})';
}


}

/// @nodoc
abstract mixin class $InvitationCopyWith<$Res>  {
  factory $InvitationCopyWith(Invitation value, $Res Function(Invitation) _then) = _$InvitationCopyWithImpl;
@useResult
$Res call({
 String id, String equbId, String inviteCode, String qrPayload
});




}
/// @nodoc
class _$InvitationCopyWithImpl<$Res>
    implements $InvitationCopyWith<$Res> {
  _$InvitationCopyWithImpl(this._self, this._then);

  final Invitation _self;
  final $Res Function(Invitation) _then;

/// Create a copy of Invitation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? equbId = null,Object? inviteCode = null,Object? qrPayload = null,}) {
  return _then(Invitation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,qrPayload: null == qrPayload ? _self.qrPayload : qrPayload // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Invitation].
extension InvitationPatterns on Invitation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Invitation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Invitation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Invitation value)  $default,){
final _that = this;
switch (_that) {
case _Invitation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Invitation value)?  $default,){
final _that = this;
switch (_that) {
case _Invitation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String equbId,  String inviteCode,  String qrPayload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Invitation() when $default != null:
return $default(_that.id,_that.equbId,_that.inviteCode,_that.qrPayload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String equbId,  String inviteCode,  String qrPayload)  $default,) {final _that = this;
switch (_that) {
case _Invitation():
return $default(_that.id,_that.equbId,_that.inviteCode,_that.qrPayload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String equbId,  String inviteCode,  String qrPayload)?  $default,) {final _that = this;
switch (_that) {
case _Invitation() when $default != null:
return $default(_that.id,_that.equbId,_that.inviteCode,_that.qrPayload);case _:
  return null;

}
}

}

/// @nodoc


class _Invitation implements Invitation {
  const _Invitation({required this.id, required this.equbId, required this.inviteCode, required this.qrPayload});
  

@override final  String id;
@override final  String equbId;
@override final  String inviteCode;
@override final  String qrPayload;

/// Create a copy of Invitation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvitationCopyWith<_Invitation> get copyWith => __$InvitationCopyWithImpl<_Invitation>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Invitation&&(identical(other.id, id) || other.id == id)&&(identical(other.equbId, equbId) || other.equbId == equbId)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.qrPayload, qrPayload) || other.qrPayload == qrPayload));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,equbId,inviteCode,qrPayload);
}

@override
String toString() {
    return 'Invitation(id: $id, equbId: $equbId, inviteCode: $inviteCode, qrPayload: $qrPayload)';
}


}

/// @nodoc
abstract mixin class _$InvitationCopyWith<$Res> implements $InvitationCopyWith<$Res> {
  factory _$InvitationCopyWith(_Invitation value, $Res Function(_Invitation) _then) = __$InvitationCopyWithImpl;
@override @useResult
$Res call({
 String id, String equbId, String inviteCode, String qrPayload
});




}
/// @nodoc
class __$InvitationCopyWithImpl<$Res>
    implements _$InvitationCopyWith<$Res> {
  __$InvitationCopyWithImpl(this._self, this._then);

  final _Invitation _self;
  final $Res Function(_Invitation) _then;

/// Create a copy of Invitation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? equbId = null,Object? inviteCode = null,Object? qrPayload = null,}) {
  return _then(_Invitation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,qrPayload: null == qrPayload ? _self.qrPayload : qrPayload // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
