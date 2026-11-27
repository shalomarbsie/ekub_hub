// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payout_draw.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PayoutDraw {

 String get id; String get equbId; String get cyclePeriodId; int get periodNumber; List<String> get eligibleMemberIds; String get selectedWinnerMemberId; DateTime get drawnAt;
/// Create a copy of PayoutDraw
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutDrawCopyWith<PayoutDraw> get copyWith => _$PayoutDrawCopyWithImpl<PayoutDraw>(this as PayoutDraw, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PayoutDraw;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutDraw&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.equbId, _this.equbId) || other.equbId == _this.equbId)&&(identical(other.cyclePeriodId, _this.cyclePeriodId) || other.cyclePeriodId == _this.cyclePeriodId)&&(identical(other.periodNumber, _this.periodNumber) || other.periodNumber == _this.periodNumber)&&const DeepCollectionEquality().equals(other.eligibleMemberIds, _this.eligibleMemberIds)&&(identical(other.selectedWinnerMemberId, _this.selectedWinnerMemberId) || other.selectedWinnerMemberId == _this.selectedWinnerMemberId)&&(identical(other.drawnAt, _this.drawnAt) || other.drawnAt == _this.drawnAt));
}


@override
int get hashCode {
  final _this = this as PayoutDraw;
  return Object.hash(runtimeType,_this.id,_this.equbId,_this.cyclePeriodId,_this.periodNumber,const DeepCollectionEquality().hash(_this.eligibleMemberIds),_this.selectedWinnerMemberId,_this.drawnAt);
}

@override
String toString() {
  final _this = this as PayoutDraw;
  return 'PayoutDraw(id: ${_this.id}, equbId: ${_this.equbId}, cyclePeriodId: ${_this.cyclePeriodId}, periodNumber: ${_this.periodNumber}, eligibleMemberIds: ${_this.eligibleMemberIds}, selectedWinnerMemberId: ${_this.selectedWinnerMemberId}, drawnAt: ${_this.drawnAt})';
}


}

/// @nodoc
abstract mixin class $PayoutDrawCopyWith<$Res>  {
  factory $PayoutDrawCopyWith(PayoutDraw value, $Res Function(PayoutDraw) _then) = _$PayoutDrawCopyWithImpl;
@useResult
$Res call({
 String id, String equbId, String cyclePeriodId, int periodNumber, List<String> eligibleMemberIds, String selectedWinnerMemberId, DateTime drawnAt
});




}
/// @nodoc
class _$PayoutDrawCopyWithImpl<$Res>
    implements $PayoutDrawCopyWith<$Res> {
  _$PayoutDrawCopyWithImpl(this._self, this._then);

  final PayoutDraw _self;
  final $Res Function(PayoutDraw) _then;

/// Create a copy of PayoutDraw
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? equbId = null,Object? cyclePeriodId = null,Object? periodNumber = null,Object? eligibleMemberIds = null,Object? selectedWinnerMemberId = null,Object? drawnAt = null,}) {
  return _then(PayoutDraw(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,cyclePeriodId: null == cyclePeriodId ? _self.cyclePeriodId : cyclePeriodId // ignore: cast_nullable_to_non_nullable
as String,periodNumber: null == periodNumber ? _self.periodNumber : periodNumber // ignore: cast_nullable_to_non_nullable
as int,eligibleMemberIds: null == eligibleMemberIds ? _self.eligibleMemberIds : eligibleMemberIds // ignore: cast_nullable_to_non_nullable
as List<String>,selectedWinnerMemberId: null == selectedWinnerMemberId ? _self.selectedWinnerMemberId : selectedWinnerMemberId // ignore: cast_nullable_to_non_nullable
as String,drawnAt: null == drawnAt ? _self.drawnAt : drawnAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PayoutDraw].
extension PayoutDrawPatterns on PayoutDraw {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutDraw value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutDraw() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutDraw value)  $default,){
final _that = this;
switch (_that) {
case _PayoutDraw():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutDraw value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutDraw() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String equbId,  String cyclePeriodId,  int periodNumber,  List<String> eligibleMemberIds,  String selectedWinnerMemberId,  DateTime drawnAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayoutDraw() when $default != null:
return $default(_that.id,_that.equbId,_that.cyclePeriodId,_that.periodNumber,_that.eligibleMemberIds,_that.selectedWinnerMemberId,_that.drawnAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String equbId,  String cyclePeriodId,  int periodNumber,  List<String> eligibleMemberIds,  String selectedWinnerMemberId,  DateTime drawnAt)  $default,) {final _that = this;
switch (_that) {
case _PayoutDraw():
return $default(_that.id,_that.equbId,_that.cyclePeriodId,_that.periodNumber,_that.eligibleMemberIds,_that.selectedWinnerMemberId,_that.drawnAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String equbId,  String cyclePeriodId,  int periodNumber,  List<String> eligibleMemberIds,  String selectedWinnerMemberId,  DateTime drawnAt)?  $default,) {final _that = this;
switch (_that) {
case _PayoutDraw() when $default != null:
return $default(_that.id,_that.equbId,_that.cyclePeriodId,_that.periodNumber,_that.eligibleMemberIds,_that.selectedWinnerMemberId,_that.drawnAt);case _:
  return null;

}
}

}

/// @nodoc


class _PayoutDraw implements PayoutDraw {
  const _PayoutDraw({required this.id, required this.equbId, required this.cyclePeriodId, required this.periodNumber, required  List<String> eligibleMemberIds, required this.selectedWinnerMemberId, required this.drawnAt}): _eligibleMemberIds = eligibleMemberIds;


@override final  String id;
@override final  String equbId;
@override final  String cyclePeriodId;
@override final  int periodNumber;
 final  List<String> _eligibleMemberIds;
@override List<String> get eligibleMemberIds {
  if (_eligibleMemberIds is EqualUnmodifiableListView) return _eligibleMemberIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eligibleMemberIds);
}

@override final  String selectedWinnerMemberId;
@override final  DateTime drawnAt;

/// Create a copy of PayoutDraw
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutDrawCopyWith<_PayoutDraw> get copyWith => __$PayoutDrawCopyWithImpl<_PayoutDraw>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutDraw&&(identical(other.id, id) || other.id == id)&&(identical(other.equbId, equbId) || other.equbId == equbId)&&(identical(other.cyclePeriodId, cyclePeriodId) || other.cyclePeriodId == cyclePeriodId)&&(identical(other.periodNumber, periodNumber) || other.periodNumber == periodNumber)&&const DeepCollectionEquality().equals(other.eligibleMemberIds, _eligibleMemberIds)&&(identical(other.selectedWinnerMemberId, selectedWinnerMemberId) || other.selectedWinnerMemberId == selectedWinnerMemberId)&&(identical(other.drawnAt, drawnAt) || other.drawnAt == drawnAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,equbId,cyclePeriodId,periodNumber,const DeepCollectionEquality().hash(_eligibleMemberIds),selectedWinnerMemberId,drawnAt);
}

@override
String toString() {
    return 'PayoutDraw(id: $id, equbId: $equbId, cyclePeriodId: $cyclePeriodId, periodNumber: $periodNumber, eligibleMemberIds: $eligibleMemberIds, selectedWinnerMemberId: $selectedWinnerMemberId, drawnAt: $drawnAt)';
}


}

/// @nodoc
abstract mixin class _$PayoutDrawCopyWith<$Res> implements $PayoutDrawCopyWith<$Res> {
  factory _$PayoutDrawCopyWith(_PayoutDraw value, $Res Function(_PayoutDraw) _then) = __$PayoutDrawCopyWithImpl;
@override @useResult
$Res call({
 String id, String equbId, String cyclePeriodId, int periodNumber, List<String> eligibleMemberIds, String selectedWinnerMemberId, DateTime drawnAt
});




}
/// @nodoc
class __$PayoutDrawCopyWithImpl<$Res>
    implements _$PayoutDrawCopyWith<$Res> {
  __$PayoutDrawCopyWithImpl(this._self, this._then);

  final _PayoutDraw _self;
  final $Res Function(_PayoutDraw) _then;

/// Create a copy of PayoutDraw
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? equbId = null,Object? cyclePeriodId = null,Object? periodNumber = null,Object? eligibleMemberIds = null,Object? selectedWinnerMemberId = null,Object? drawnAt = null,}) {
  return _then(_PayoutDraw(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,equbId: null == equbId ? _self.equbId : equbId // ignore: cast_nullable_to_non_nullable
as String,cyclePeriodId: null == cyclePeriodId ? _self.cyclePeriodId : cyclePeriodId // ignore: cast_nullable_to_non_nullable
as String,periodNumber: null == periodNumber ? _self.periodNumber : periodNumber // ignore: cast_nullable_to_non_nullable
as int,eligibleMemberIds: null == eligibleMemberIds ? _self._eligibleMemberIds : eligibleMemberIds // ignore: cast_nullable_to_non_nullable
as List<String>,selectedWinnerMemberId: null == selectedWinnerMemberId ? _self.selectedWinnerMemberId : selectedWinnerMemberId // ignore: cast_nullable_to_non_nullable
as String,drawnAt: null == drawnAt ? _self.drawnAt : drawnAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$PayoutMemberInfo {

 Membership get membership; String get memberName; bool get hasWonInCycle;
/// Create a copy of PayoutMemberInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutMemberInfoCopyWith<PayoutMemberInfo> get copyWith => _$PayoutMemberInfoCopyWithImpl<PayoutMemberInfo>(this as PayoutMemberInfo, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PayoutMemberInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutMemberInfo&&(identical(other.membership, _this.membership) || other.membership == _this.membership)&&(identical(other.memberName, _this.memberName) || other.memberName == _this.memberName)&&(identical(other.hasWonInCycle, _this.hasWonInCycle) || other.hasWonInCycle == _this.hasWonInCycle));
}


@override
int get hashCode {
  final _this = this as PayoutMemberInfo;
  return Object.hash(runtimeType,_this.membership,_this.memberName,_this.hasWonInCycle);
}

@override
String toString() {
  final _this = this as PayoutMemberInfo;
  return 'PayoutMemberInfo(membership: ${_this.membership}, memberName: ${_this.memberName}, hasWonInCycle: ${_this.hasWonInCycle})';
}


}

/// @nodoc
abstract mixin class $PayoutMemberInfoCopyWith<$Res>  {
  factory $PayoutMemberInfoCopyWith(PayoutMemberInfo value, $Res Function(PayoutMemberInfo) _then) = _$PayoutMemberInfoCopyWithImpl;
@useResult
$Res call({
 Membership membership, String memberName, bool hasWonInCycle
});


$MembershipCopyWith<$Res> get membership;

}
/// @nodoc
class _$PayoutMemberInfoCopyWithImpl<$Res>
    implements $PayoutMemberInfoCopyWith<$Res> {
  _$PayoutMemberInfoCopyWithImpl(this._self, this._then);

  final PayoutMemberInfo _self;
  final $Res Function(PayoutMemberInfo) _then;

/// Create a copy of PayoutMemberInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? membership = null,Object? memberName = null,Object? hasWonInCycle = null,}) {
  return _then(PayoutMemberInfo(
membership: null == membership ? _self.membership : membership // ignore: cast_nullable_to_non_nullable
as Membership,memberName: null == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String,hasWonInCycle: null == hasWonInCycle ? _self.hasWonInCycle : hasWonInCycle // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PayoutMemberInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MembershipCopyWith<$Res> get membership {

  return $MembershipCopyWith<$Res>(_self.membership, (value) {
    return _then(_self.copyWith(membership: value));
  });
}
}


/// Adds pattern-matching-related methods to [PayoutMemberInfo].
extension PayoutMemberInfoPatterns on PayoutMemberInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutMemberInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutMemberInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutMemberInfo value)  $default,){
final _that = this;
switch (_that) {
case _PayoutMemberInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutMemberInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutMemberInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Membership membership,  String memberName,  bool hasWonInCycle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayoutMemberInfo() when $default != null:
return $default(_that.membership,_that.memberName,_that.hasWonInCycle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Membership membership,  String memberName,  bool hasWonInCycle)  $default,) {final _that = this;
switch (_that) {
case _PayoutMemberInfo():
return $default(_that.membership,_that.memberName,_that.hasWonInCycle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Membership membership,  String memberName,  bool hasWonInCycle)?  $default,) {final _that = this;
switch (_that) {
case _PayoutMemberInfo() when $default != null:
return $default(_that.membership,_that.memberName,_that.hasWonInCycle);case _:
  return null;

}
}

}

/// @nodoc


class _PayoutMemberInfo implements PayoutMemberInfo {
  const _PayoutMemberInfo({required this.membership, required this.memberName, required this.hasWonInCycle});


@override final  Membership membership;
@override final  String memberName;
@override final  bool hasWonInCycle;

/// Create a copy of PayoutMemberInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutMemberInfoCopyWith<_PayoutMemberInfo> get copyWith => __$PayoutMemberInfoCopyWithImpl<_PayoutMemberInfo>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutMemberInfo&&(identical(other.membership, membership) || other.membership == membership)&&(identical(other.memberName, memberName) || other.memberName == memberName)&&(identical(other.hasWonInCycle, hasWonInCycle) || other.hasWonInCycle == hasWonInCycle));
}


@override
int get hashCode {
    return Object.hash(runtimeType,membership,memberName,hasWonInCycle);
}

@override
String toString() {
    return 'PayoutMemberInfo(membership: $membership, memberName: $memberName, hasWonInCycle: $hasWonInCycle)';
}


}

/// @nodoc
abstract mixin class _$PayoutMemberInfoCopyWith<$Res> implements $PayoutMemberInfoCopyWith<$Res> {
  factory _$PayoutMemberInfoCopyWith(_PayoutMemberInfo value, $Res Function(_PayoutMemberInfo) _then) = __$PayoutMemberInfoCopyWithImpl;
@override @useResult
$Res call({
 Membership membership, String memberName, bool hasWonInCycle
});


@override $MembershipCopyWith<$Res> get membership;

}
/// @nodoc
class __$PayoutMemberInfoCopyWithImpl<$Res>
    implements _$PayoutMemberInfoCopyWith<$Res> {
  __$PayoutMemberInfoCopyWithImpl(this._self, this._then);

  final _PayoutMemberInfo _self;
  final $Res Function(_PayoutMemberInfo) _then;

/// Create a copy of PayoutMemberInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? membership = null,Object? memberName = null,Object? hasWonInCycle = null,}) {
  return _then(_PayoutMemberInfo(
membership: null == membership ? _self.membership : membership // ignore: cast_nullable_to_non_nullable
as Membership,memberName: null == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String,hasWonInCycle: null == hasWonInCycle ? _self.hasWonInCycle : hasWonInCycle // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PayoutMemberInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MembershipCopyWith<$Res> get membership {

  return $MembershipCopyWith<$Res>(_self.membership, (value) {
    return _then(_self.copyWith(membership: value));
  });
}
}

/// @nodoc
mixin _$PayoutHistoryItem {

 PayoutDraw get draw; String get winnerName;
/// Create a copy of PayoutHistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutHistoryItemCopyWith<PayoutHistoryItem> get copyWith => _$PayoutHistoryItemCopyWithImpl<PayoutHistoryItem>(this as PayoutHistoryItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PayoutHistoryItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutHistoryItem&&(identical(other.draw, _this.draw) || other.draw == _this.draw)&&(identical(other.winnerName, _this.winnerName) || other.winnerName == _this.winnerName));
}


@override
int get hashCode {
  final _this = this as PayoutHistoryItem;
  return Object.hash(runtimeType,_this.draw,_this.winnerName);
}

@override
String toString() {
  final _this = this as PayoutHistoryItem;
  return 'PayoutHistoryItem(draw: ${_this.draw}, winnerName: ${_this.winnerName})';
}


}

/// @nodoc
abstract mixin class $PayoutHistoryItemCopyWith<$Res>  {
  factory $PayoutHistoryItemCopyWith(PayoutHistoryItem value, $Res Function(PayoutHistoryItem) _then) = _$PayoutHistoryItemCopyWithImpl;
@useResult
$Res call({
 PayoutDraw draw, String winnerName
});


$PayoutDrawCopyWith<$Res> get draw;

}
/// @nodoc
class _$PayoutHistoryItemCopyWithImpl<$Res>
    implements $PayoutHistoryItemCopyWith<$Res> {
  _$PayoutHistoryItemCopyWithImpl(this._self, this._then);

  final PayoutHistoryItem _self;
  final $Res Function(PayoutHistoryItem) _then;

/// Create a copy of PayoutHistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? draw = null,Object? winnerName = null,}) {
  return _then(PayoutHistoryItem(
draw: null == draw ? _self.draw : draw // ignore: cast_nullable_to_non_nullable
as PayoutDraw,winnerName: null == winnerName ? _self.winnerName : winnerName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of PayoutHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PayoutDrawCopyWith<$Res> get draw {

  return $PayoutDrawCopyWith<$Res>(_self.draw, (value) {
    return _then(_self.copyWith(draw: value));
  });
}
}


/// Adds pattern-matching-related methods to [PayoutHistoryItem].
extension PayoutHistoryItemPatterns on PayoutHistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutHistoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutHistoryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutHistoryItem value)  $default,){
final _that = this;
switch (_that) {
case _PayoutHistoryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutHistoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutHistoryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PayoutDraw draw,  String winnerName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayoutHistoryItem() when $default != null:
return $default(_that.draw,_that.winnerName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PayoutDraw draw,  String winnerName)  $default,) {final _that = this;
switch (_that) {
case _PayoutHistoryItem():
return $default(_that.draw,_that.winnerName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PayoutDraw draw,  String winnerName)?  $default,) {final _that = this;
switch (_that) {
case _PayoutHistoryItem() when $default != null:
return $default(_that.draw,_that.winnerName);case _:
  return null;

}
}

}

/// @nodoc


class _PayoutHistoryItem implements PayoutHistoryItem {
  const _PayoutHistoryItem({required this.draw, required this.winnerName});


@override final  PayoutDraw draw;
@override final  String winnerName;

/// Create a copy of PayoutHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutHistoryItemCopyWith<_PayoutHistoryItem> get copyWith => __$PayoutHistoryItemCopyWithImpl<_PayoutHistoryItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutHistoryItem&&(identical(other.draw, draw) || other.draw == draw)&&(identical(other.winnerName, winnerName) || other.winnerName == winnerName));
}


@override
int get hashCode {
    return Object.hash(runtimeType,draw,winnerName);
}

@override
String toString() {
    return 'PayoutHistoryItem(draw: $draw, winnerName: $winnerName)';
}


}

/// @nodoc
abstract mixin class _$PayoutHistoryItemCopyWith<$Res> implements $PayoutHistoryItemCopyWith<$Res> {
  factory _$PayoutHistoryItemCopyWith(_PayoutHistoryItem value, $Res Function(_PayoutHistoryItem) _then) = __$PayoutHistoryItemCopyWithImpl;
@override @useResult
$Res call({
 PayoutDraw draw, String winnerName
});


@override $PayoutDrawCopyWith<$Res> get draw;

}
/// @nodoc
class __$PayoutHistoryItemCopyWithImpl<$Res>
    implements _$PayoutHistoryItemCopyWith<$Res> {
  __$PayoutHistoryItemCopyWithImpl(this._self, this._then);

  final _PayoutHistoryItem _self;
  final $Res Function(_PayoutHistoryItem) _then;

/// Create a copy of PayoutHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draw = null,Object? winnerName = null,}) {
  return _then(_PayoutHistoryItem(
draw: null == draw ? _self.draw : draw // ignore: cast_nullable_to_non_nullable
as PayoutDraw,winnerName: null == winnerName ? _self.winnerName : winnerName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of PayoutHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PayoutDrawCopyWith<$Res> get draw {

  return $PayoutDrawCopyWith<$Res>(_self.draw, (value) {
    return _then(_self.copyWith(draw: value));
  });
}
}

/// @nodoc
mixin _$PayoutReadiness {

 int get totalActiveMembers; int get approvedCount; int get pendingCount; int get rejectedCount; int get notSubmittedCount; bool get isContributionComplete; List<PayoutMemberInfo> get eligibleMembers; List<PayoutHistoryItem> get pastDraws; PayoutHistoryItem? get currentRoundDraw;
/// Create a copy of PayoutReadiness
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutReadinessCopyWith<PayoutReadiness> get copyWith => _$PayoutReadinessCopyWithImpl<PayoutReadiness>(this as PayoutReadiness, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PayoutReadiness;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutReadiness&&(identical(other.totalActiveMembers, _this.totalActiveMembers) || other.totalActiveMembers == _this.totalActiveMembers)&&(identical(other.approvedCount, _this.approvedCount) || other.approvedCount == _this.approvedCount)&&(identical(other.pendingCount, _this.pendingCount) || other.pendingCount == _this.pendingCount)&&(identical(other.rejectedCount, _this.rejectedCount) || other.rejectedCount == _this.rejectedCount)&&(identical(other.notSubmittedCount, _this.notSubmittedCount) || other.notSubmittedCount == _this.notSubmittedCount)&&(identical(other.isContributionComplete, _this.isContributionComplete) || other.isContributionComplete == _this.isContributionComplete)&&const DeepCollectionEquality().equals(other.eligibleMembers, _this.eligibleMembers)&&const DeepCollectionEquality().equals(other.pastDraws, _this.pastDraws)&&(identical(other.currentRoundDraw, _this.currentRoundDraw) || other.currentRoundDraw == _this.currentRoundDraw));
}


@override
int get hashCode {
  final _this = this as PayoutReadiness;
  return Object.hash(runtimeType,_this.totalActiveMembers,_this.approvedCount,_this.pendingCount,_this.rejectedCount,_this.notSubmittedCount,_this.isContributionComplete,const DeepCollectionEquality().hash(_this.eligibleMembers),const DeepCollectionEquality().hash(_this.pastDraws),_this.currentRoundDraw);
}

@override
String toString() {
  final _this = this as PayoutReadiness;
  return 'PayoutReadiness(totalActiveMembers: ${_this.totalActiveMembers}, approvedCount: ${_this.approvedCount}, pendingCount: ${_this.pendingCount}, rejectedCount: ${_this.rejectedCount}, notSubmittedCount: ${_this.notSubmittedCount}, isContributionComplete: ${_this.isContributionComplete}, eligibleMembers: ${_this.eligibleMembers}, pastDraws: ${_this.pastDraws}, currentRoundDraw: ${_this.currentRoundDraw})';
}


}

/// @nodoc
abstract mixin class $PayoutReadinessCopyWith<$Res>  {
  factory $PayoutReadinessCopyWith(PayoutReadiness value, $Res Function(PayoutReadiness) _then) = _$PayoutReadinessCopyWithImpl;
@useResult
$Res call({
 int totalActiveMembers, int approvedCount, int pendingCount, int rejectedCount, int notSubmittedCount, bool isContributionComplete, List<PayoutMemberInfo> eligibleMembers, List<PayoutHistoryItem> pastDraws, PayoutHistoryItem? currentRoundDraw
});


$PayoutHistoryItemCopyWith<$Res>? get currentRoundDraw;

}
/// @nodoc
class _$PayoutReadinessCopyWithImpl<$Res>
    implements $PayoutReadinessCopyWith<$Res> {
  _$PayoutReadinessCopyWithImpl(this._self, this._then);

  final PayoutReadiness _self;
  final $Res Function(PayoutReadiness) _then;

/// Create a copy of PayoutReadiness
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalActiveMembers = null,Object? approvedCount = null,Object? pendingCount = null,Object? rejectedCount = null,Object? notSubmittedCount = null,Object? isContributionComplete = null,Object? eligibleMembers = null,Object? pastDraws = null,Object? currentRoundDraw = freezed,}) {
  return _then(PayoutReadiness(
totalActiveMembers: null == totalActiveMembers ? _self.totalActiveMembers : totalActiveMembers // ignore: cast_nullable_to_non_nullable
as int,approvedCount: null == approvedCount ? _self.approvedCount : approvedCount // ignore: cast_nullable_to_non_nullable
as int,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,rejectedCount: null == rejectedCount ? _self.rejectedCount : rejectedCount // ignore: cast_nullable_to_non_nullable
as int,notSubmittedCount: null == notSubmittedCount ? _self.notSubmittedCount : notSubmittedCount // ignore: cast_nullable_to_non_nullable
as int,isContributionComplete: null == isContributionComplete ? _self.isContributionComplete : isContributionComplete // ignore: cast_nullable_to_non_nullable
as bool,eligibleMembers: null == eligibleMembers ? _self.eligibleMembers : eligibleMembers // ignore: cast_nullable_to_non_nullable
as List<PayoutMemberInfo>,pastDraws: null == pastDraws ? _self.pastDraws : pastDraws // ignore: cast_nullable_to_non_nullable
as List<PayoutHistoryItem>,currentRoundDraw: freezed == currentRoundDraw ? _self.currentRoundDraw : currentRoundDraw // ignore: cast_nullable_to_non_nullable
as PayoutHistoryItem?,
  ));
}
/// Create a copy of PayoutReadiness
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PayoutHistoryItemCopyWith<$Res>? get currentRoundDraw {
    if (_self.currentRoundDraw == null) {
    return null;
  }

  return $PayoutHistoryItemCopyWith<$Res>(_self.currentRoundDraw!, (value) {
    return _then(_self.copyWith(currentRoundDraw: value));
  });
}
}


/// Adds pattern-matching-related methods to [PayoutReadiness].
extension PayoutReadinessPatterns on PayoutReadiness {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutReadiness value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutReadiness() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutReadiness value)  $default,){
final _that = this;
switch (_that) {
case _PayoutReadiness():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutReadiness value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutReadiness() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalActiveMembers,  int approvedCount,  int pendingCount,  int rejectedCount,  int notSubmittedCount,  bool isContributionComplete,  List<PayoutMemberInfo> eligibleMembers,  List<PayoutHistoryItem> pastDraws,  PayoutHistoryItem? currentRoundDraw)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayoutReadiness() when $default != null:
return $default(_that.totalActiveMembers,_that.approvedCount,_that.pendingCount,_that.rejectedCount,_that.notSubmittedCount,_that.isContributionComplete,_that.eligibleMembers,_that.pastDraws,_that.currentRoundDraw);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalActiveMembers,  int approvedCount,  int pendingCount,  int rejectedCount,  int notSubmittedCount,  bool isContributionComplete,  List<PayoutMemberInfo> eligibleMembers,  List<PayoutHistoryItem> pastDraws,  PayoutHistoryItem? currentRoundDraw)  $default,) {final _that = this;
switch (_that) {
case _PayoutReadiness():
return $default(_that.totalActiveMembers,_that.approvedCount,_that.pendingCount,_that.rejectedCount,_that.notSubmittedCount,_that.isContributionComplete,_that.eligibleMembers,_that.pastDraws,_that.currentRoundDraw);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalActiveMembers,  int approvedCount,  int pendingCount,  int rejectedCount,  int notSubmittedCount,  bool isContributionComplete,  List<PayoutMemberInfo> eligibleMembers,  List<PayoutHistoryItem> pastDraws,  PayoutHistoryItem? currentRoundDraw)?  $default,) {final _that = this;
switch (_that) {
case _PayoutReadiness() when $default != null:
return $default(_that.totalActiveMembers,_that.approvedCount,_that.pendingCount,_that.rejectedCount,_that.notSubmittedCount,_that.isContributionComplete,_that.eligibleMembers,_that.pastDraws,_that.currentRoundDraw);case _:
  return null;

}
}

}

/// @nodoc


class _PayoutReadiness extends PayoutReadiness {
  const _PayoutReadiness({required this.totalActiveMembers, required this.approvedCount, required this.pendingCount, required this.rejectedCount, required this.notSubmittedCount, required this.isContributionComplete, required  List<PayoutMemberInfo> eligibleMembers, required  List<PayoutHistoryItem> pastDraws, this.currentRoundDraw}): _eligibleMembers = eligibleMembers,_pastDraws = pastDraws,super._();


@override final  int totalActiveMembers;
@override final  int approvedCount;
@override final  int pendingCount;
@override final  int rejectedCount;
@override final  int notSubmittedCount;
@override final  bool isContributionComplete;
 final  List<PayoutMemberInfo> _eligibleMembers;
@override List<PayoutMemberInfo> get eligibleMembers {
  if (_eligibleMembers is EqualUnmodifiableListView) return _eligibleMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eligibleMembers);
}

 final  List<PayoutHistoryItem> _pastDraws;
@override List<PayoutHistoryItem> get pastDraws {
  if (_pastDraws is EqualUnmodifiableListView) return _pastDraws;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pastDraws);
}

@override final  PayoutHistoryItem? currentRoundDraw;

/// Create a copy of PayoutReadiness
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutReadinessCopyWith<_PayoutReadiness> get copyWith => __$PayoutReadinessCopyWithImpl<_PayoutReadiness>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutReadiness&&(identical(other.totalActiveMembers, totalActiveMembers) || other.totalActiveMembers == totalActiveMembers)&&(identical(other.approvedCount, approvedCount) || other.approvedCount == approvedCount)&&(identical(other.pendingCount, pendingCount) || other.pendingCount == pendingCount)&&(identical(other.rejectedCount, rejectedCount) || other.rejectedCount == rejectedCount)&&(identical(other.notSubmittedCount, notSubmittedCount) || other.notSubmittedCount == notSubmittedCount)&&(identical(other.isContributionComplete, isContributionComplete) || other.isContributionComplete == isContributionComplete)&&const DeepCollectionEquality().equals(other.eligibleMembers, _eligibleMembers)&&const DeepCollectionEquality().equals(other.pastDraws, _pastDraws)&&(identical(other.currentRoundDraw, currentRoundDraw) || other.currentRoundDraw == currentRoundDraw));
}


@override
int get hashCode {
    return Object.hash(runtimeType,totalActiveMembers,approvedCount,pendingCount,rejectedCount,notSubmittedCount,isContributionComplete,const DeepCollectionEquality().hash(_eligibleMembers),const DeepCollectionEquality().hash(_pastDraws),currentRoundDraw);
}

@override
String toString() {
    return 'PayoutReadiness(totalActiveMembers: $totalActiveMembers, approvedCount: $approvedCount, pendingCount: $pendingCount, rejectedCount: $rejectedCount, notSubmittedCount: $notSubmittedCount, isContributionComplete: $isContributionComplete, eligibleMembers: $eligibleMembers, pastDraws: $pastDraws, currentRoundDraw: $currentRoundDraw)';
}


}

/// @nodoc
abstract mixin class _$PayoutReadinessCopyWith<$Res> implements $PayoutReadinessCopyWith<$Res> {
  factory _$PayoutReadinessCopyWith(_PayoutReadiness value, $Res Function(_PayoutReadiness) _then) = __$PayoutReadinessCopyWithImpl;
@override @useResult
$Res call({
 int totalActiveMembers, int approvedCount, int pendingCount, int rejectedCount, int notSubmittedCount, bool isContributionComplete, List<PayoutMemberInfo> eligibleMembers, List<PayoutHistoryItem> pastDraws, PayoutHistoryItem? currentRoundDraw
});


@override $PayoutHistoryItemCopyWith<$Res>? get currentRoundDraw;

}
/// @nodoc
class __$PayoutReadinessCopyWithImpl<$Res>
    implements _$PayoutReadinessCopyWith<$Res> {
  __$PayoutReadinessCopyWithImpl(this._self, this._then);

  final _PayoutReadiness _self;
  final $Res Function(_PayoutReadiness) _then;

/// Create a copy of PayoutReadiness
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalActiveMembers = null,Object? approvedCount = null,Object? pendingCount = null,Object? rejectedCount = null,Object? notSubmittedCount = null,Object? isContributionComplete = null,Object? eligibleMembers = null,Object? pastDraws = null,Object? currentRoundDraw = freezed,}) {
  return _then(_PayoutReadiness(
totalActiveMembers: null == totalActiveMembers ? _self.totalActiveMembers : totalActiveMembers // ignore: cast_nullable_to_non_nullable
as int,approvedCount: null == approvedCount ? _self.approvedCount : approvedCount // ignore: cast_nullable_to_non_nullable
as int,pendingCount: null == pendingCount ? _self.pendingCount : pendingCount // ignore: cast_nullable_to_non_nullable
as int,rejectedCount: null == rejectedCount ? _self.rejectedCount : rejectedCount // ignore: cast_nullable_to_non_nullable
as int,notSubmittedCount: null == notSubmittedCount ? _self.notSubmittedCount : notSubmittedCount // ignore: cast_nullable_to_non_nullable
as int,isContributionComplete: null == isContributionComplete ? _self.isContributionComplete : isContributionComplete // ignore: cast_nullable_to_non_nullable
as bool,eligibleMembers: null == eligibleMembers ? _self._eligibleMembers : eligibleMembers // ignore: cast_nullable_to_non_nullable
as List<PayoutMemberInfo>,pastDraws: null == pastDraws ? _self._pastDraws : pastDraws // ignore: cast_nullable_to_non_nullable
as List<PayoutHistoryItem>,currentRoundDraw: freezed == currentRoundDraw ? _self.currentRoundDraw : currentRoundDraw // ignore: cast_nullable_to_non_nullable
as PayoutHistoryItem?,
  ));
}

/// Create a copy of PayoutReadiness
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PayoutHistoryItemCopyWith<$Res>? get currentRoundDraw {
    if (_self.currentRoundDraw == null) {
    return null;
  }

  return $PayoutHistoryItemCopyWith<$Res>(_self.currentRoundDraw!, (value) {
    return _then(_self.copyWith(currentRoundDraw: value));
  });
}
}

// dart format on
