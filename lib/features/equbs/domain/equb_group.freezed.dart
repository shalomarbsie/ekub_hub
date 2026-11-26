// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equb_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EqubGroup {

 String get id; String get title; String get description; int get contributionAmount; EqubFrequency get frequency; int get memberLimit; String get organizerId; DateTime get createdAt;
/// Create a copy of EqubGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EqubGroupCopyWith<EqubGroup> get copyWith => _$EqubGroupCopyWithImpl<EqubGroup>(this as EqubGroup, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EqubGroup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EqubGroup&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.contributionAmount, _this.contributionAmount) || other.contributionAmount == _this.contributionAmount)&&(identical(other.frequency, _this.frequency) || other.frequency == _this.frequency)&&(identical(other.memberLimit, _this.memberLimit) || other.memberLimit == _this.memberLimit)&&(identical(other.organizerId, _this.organizerId) || other.organizerId == _this.organizerId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as EqubGroup;
  return Object.hash(runtimeType,_this.id,_this.title,_this.description,_this.contributionAmount,_this.frequency,_this.memberLimit,_this.organizerId,_this.createdAt);
}

@override
String toString() {
  final _this = this as EqubGroup;
  return 'EqubGroup(id: ${_this.id}, title: ${_this.title}, description: ${_this.description}, contributionAmount: ${_this.contributionAmount}, frequency: ${_this.frequency}, memberLimit: ${_this.memberLimit}, organizerId: ${_this.organizerId}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $EqubGroupCopyWith<$Res>  {
  factory $EqubGroupCopyWith(EqubGroup value, $Res Function(EqubGroup) _then) = _$EqubGroupCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, int contributionAmount, EqubFrequency frequency, int memberLimit, String organizerId, DateTime createdAt
});




}
/// @nodoc
class _$EqubGroupCopyWithImpl<$Res>
    implements $EqubGroupCopyWith<$Res> {
  _$EqubGroupCopyWithImpl(this._self, this._then);

  final EqubGroup _self;
  final $Res Function(EqubGroup) _then;

/// Create a copy of EqubGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? contributionAmount = null,Object? frequency = null,Object? memberLimit = null,Object? organizerId = null,Object? createdAt = null,}) {
  return _then(EqubGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,contributionAmount: null == contributionAmount ? _self.contributionAmount : contributionAmount // ignore: cast_nullable_to_non_nullable
as int,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as EqubFrequency,memberLimit: null == memberLimit ? _self.memberLimit : memberLimit // ignore: cast_nullable_to_non_nullable
as int,organizerId: null == organizerId ? _self.organizerId : organizerId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [EqubGroup].
extension EqubGroupPatterns on EqubGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EqubGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EqubGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EqubGroup value)  $default,){
final _that = this;
switch (_that) {
case _EqubGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EqubGroup value)?  $default,){
final _that = this;
switch (_that) {
case _EqubGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  int contributionAmount,  EqubFrequency frequency,  int memberLimit,  String organizerId,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EqubGroup() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.contributionAmount,_that.frequency,_that.memberLimit,_that.organizerId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  int contributionAmount,  EqubFrequency frequency,  int memberLimit,  String organizerId,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _EqubGroup():
return $default(_that.id,_that.title,_that.description,_that.contributionAmount,_that.frequency,_that.memberLimit,_that.organizerId,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  int contributionAmount,  EqubFrequency frequency,  int memberLimit,  String organizerId,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _EqubGroup() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.contributionAmount,_that.frequency,_that.memberLimit,_that.organizerId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _EqubGroup implements EqubGroup {
  const _EqubGroup({required this.id, required this.title, required this.description, required this.contributionAmount, required this.frequency, required this.memberLimit, required this.organizerId, required this.createdAt});


@override final  String id;
@override final  String title;
@override final  String description;
@override final  int contributionAmount;
@override final  EqubFrequency frequency;
@override final  int memberLimit;
@override final  String organizerId;
@override final  DateTime createdAt;

/// Create a copy of EqubGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EqubGroupCopyWith<_EqubGroup> get copyWith => __$EqubGroupCopyWithImpl<_EqubGroup>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EqubGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.contributionAmount, contributionAmount) || other.contributionAmount == contributionAmount)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.memberLimit, memberLimit) || other.memberLimit == memberLimit)&&(identical(other.organizerId, organizerId) || other.organizerId == organizerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,description,contributionAmount,frequency,memberLimit,organizerId,createdAt);
}

@override
String toString() {
    return 'EqubGroup(id: $id, title: $title, description: $description, contributionAmount: $contributionAmount, frequency: $frequency, memberLimit: $memberLimit, organizerId: $organizerId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$EqubGroupCopyWith<$Res> implements $EqubGroupCopyWith<$Res> {
  factory _$EqubGroupCopyWith(_EqubGroup value, $Res Function(_EqubGroup) _then) = __$EqubGroupCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, int contributionAmount, EqubFrequency frequency, int memberLimit, String organizerId, DateTime createdAt
});




}
/// @nodoc
class __$EqubGroupCopyWithImpl<$Res>
    implements _$EqubGroupCopyWith<$Res> {
  __$EqubGroupCopyWithImpl(this._self, this._then);

  final _EqubGroup _self;
  final $Res Function(_EqubGroup) _then;

/// Create a copy of EqubGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? contributionAmount = null,Object? frequency = null,Object? memberLimit = null,Object? organizerId = null,Object? createdAt = null,}) {
  return _then(_EqubGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,contributionAmount: null == contributionAmount ? _self.contributionAmount : contributionAmount // ignore: cast_nullable_to_non_nullable
as int,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as EqubFrequency,memberLimit: null == memberLimit ? _self.memberLimit : memberLimit // ignore: cast_nullable_to_non_nullable
as int,organizerId: null == organizerId ? _self.organizerId : organizerId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
