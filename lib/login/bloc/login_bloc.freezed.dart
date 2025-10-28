// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginState {
  String? get token => throw _privateConstructorUsedError;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
    LoginState value,
    $Res Function(LoginState) then,
  ) = _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call({String? token});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = freezed}) {
    return _then(
      _value.copyWith(
            token: freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
    _$LoginStateImpl value,
    $Res Function(_$LoginStateImpl) then,
  ) = __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
    _$LoginStateImpl _value,
    $Res Function(_$LoginStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = freezed}) {
    return _then(
      _$LoginStateImpl(
        token: freezed == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  const _$LoginStateImpl({this.token});

  @override
  final String? token;

  @override
  String toString() {
    return 'LoginState(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState({final String? token}) = _$LoginStateImpl;

  @override
  String? get token;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )
    loginInit,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )
    registerPersonal,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )
    documentInfo,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )?
    loginInit,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )?
    registerPersonal,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )?
    documentInfo,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )?
    loginInit,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )?
    registerPersonal,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )?
    documentInfo,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_LoginInitEvent value) loginInit,
    required TResult Function(_RegisterPersonalEvent value) registerPersonal,
    required TResult Function(_DocumentInfoEvent value) documentInfo,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_LoginInitEvent value)? loginInit,
    TResult? Function(_RegisterPersonalEvent value)? registerPersonal,
    TResult? Function(_DocumentInfoEvent value)? documentInfo,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_LoginInitEvent value)? loginInit,
    TResult Function(_RegisterPersonalEvent value)? registerPersonal,
    TResult Function(_DocumentInfoEvent value)? documentInfo,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
    LoginEvent value,
    $Res Function(LoginEvent) then,
  ) = _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialEventImplCopyWith<$Res> {
  factory _$$InitialEventImplCopyWith(
    _$InitialEventImpl value,
    $Res Function(_$InitialEventImpl) then,
  ) = __$$InitialEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$InitialEventImpl>
    implements _$$InitialEventImplCopyWith<$Res> {
  __$$InitialEventImplCopyWithImpl(
    _$InitialEventImpl _value,
    $Res Function(_$InitialEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialEventImpl implements _InitialEvent {
  const _$InitialEventImpl();

  @override
  String toString() {
    return 'LoginEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )
    loginInit,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )
    registerPersonal,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )
    documentInfo,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )?
    loginInit,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )?
    registerPersonal,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )?
    documentInfo,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )?
    loginInit,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )?
    registerPersonal,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )?
    documentInfo,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_LoginInitEvent value) loginInit,
    required TResult Function(_RegisterPersonalEvent value) registerPersonal,
    required TResult Function(_DocumentInfoEvent value) documentInfo,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_LoginInitEvent value)? loginInit,
    TResult? Function(_RegisterPersonalEvent value)? registerPersonal,
    TResult? Function(_DocumentInfoEvent value)? documentInfo,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_LoginInitEvent value)? loginInit,
    TResult Function(_RegisterPersonalEvent value)? registerPersonal,
    TResult Function(_DocumentInfoEvent value)? documentInfo,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialEvent implements LoginEvent {
  const factory _InitialEvent() = _$InitialEventImpl;
}

/// @nodoc
abstract class _$$LoginInitEventImplCopyWith<$Res> {
  factory _$$LoginInitEventImplCopyWith(
    _$LoginInitEventImpl value,
    $Res Function(_$LoginInitEventImpl) then,
  ) = __$$LoginInitEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    dynamic Function(dynamic)? befor,
    dynamic Function(dynamic)? success,
    dynamic Function(dynamic)? error,
    String userName,
    String password,
  });
}

/// @nodoc
class __$$LoginInitEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginInitEventImpl>
    implements _$$LoginInitEventImplCopyWith<$Res> {
  __$$LoginInitEventImplCopyWithImpl(
    _$LoginInitEventImpl _value,
    $Res Function(_$LoginInitEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? befor = freezed,
    Object? success = freezed,
    Object? error = freezed,
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(
      _$LoginInitEventImpl(
        befor: freezed == befor
            ? _value.befor
            : befor // ignore: cast_nullable_to_non_nullable
                  as dynamic Function(dynamic)?,
        success: freezed == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as dynamic Function(dynamic)?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as dynamic Function(dynamic)?,
        userName: null == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoginInitEventImpl implements _LoginInitEvent {
  const _$LoginInitEventImpl({
    this.befor,
    this.success,
    this.error,
    required this.userName,
    required this.password,
  });

  @override
  final dynamic Function(dynamic)? befor;
  @override
  final dynamic Function(dynamic)? success;
  @override
  final dynamic Function(dynamic)? error;
  @override
  final String userName;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.loginInit(befor: $befor, success: $success, error: $error, userName: $userName, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginInitEventImpl &&
            (identical(other.befor, befor) || other.befor == befor) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, befor, success, error, userName, password);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginInitEventImplCopyWith<_$LoginInitEventImpl> get copyWith =>
      __$$LoginInitEventImplCopyWithImpl<_$LoginInitEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )
    loginInit,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )
    registerPersonal,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )
    documentInfo,
  }) {
    return loginInit(befor, success, error, userName, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )?
    loginInit,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )?
    registerPersonal,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )?
    documentInfo,
  }) {
    return loginInit?.call(befor, success, error, userName, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )?
    loginInit,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )?
    registerPersonal,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )?
    documentInfo,
    required TResult orElse(),
  }) {
    if (loginInit != null) {
      return loginInit(befor, success, error, userName, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_LoginInitEvent value) loginInit,
    required TResult Function(_RegisterPersonalEvent value) registerPersonal,
    required TResult Function(_DocumentInfoEvent value) documentInfo,
  }) {
    return loginInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_LoginInitEvent value)? loginInit,
    TResult? Function(_RegisterPersonalEvent value)? registerPersonal,
    TResult? Function(_DocumentInfoEvent value)? documentInfo,
  }) {
    return loginInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_LoginInitEvent value)? loginInit,
    TResult Function(_RegisterPersonalEvent value)? registerPersonal,
    TResult Function(_DocumentInfoEvent value)? documentInfo,
    required TResult orElse(),
  }) {
    if (loginInit != null) {
      return loginInit(this);
    }
    return orElse();
  }
}

abstract class _LoginInitEvent implements LoginEvent {
  const factory _LoginInitEvent({
    final dynamic Function(dynamic)? befor,
    final dynamic Function(dynamic)? success,
    final dynamic Function(dynamic)? error,
    required final String userName,
    required final String password,
  }) = _$LoginInitEventImpl;

  dynamic Function(dynamic)? get befor;
  dynamic Function(dynamic)? get success;
  dynamic Function(dynamic)? get error;
  String get userName;
  String get password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginInitEventImplCopyWith<_$LoginInitEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterPersonalEventImplCopyWith<$Res> {
  factory _$$RegisterPersonalEventImplCopyWith(
    _$RegisterPersonalEventImpl value,
    $Res Function(_$RegisterPersonalEventImpl) then,
  ) = __$$RegisterPersonalEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    dynamic Function(dynamic)? befor,
    dynamic Function(dynamic)? success,
    dynamic Function(dynamic)? error,
    PersonalInfoModel personalInfo,
  });
}

/// @nodoc
class __$$RegisterPersonalEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$RegisterPersonalEventImpl>
    implements _$$RegisterPersonalEventImplCopyWith<$Res> {
  __$$RegisterPersonalEventImplCopyWithImpl(
    _$RegisterPersonalEventImpl _value,
    $Res Function(_$RegisterPersonalEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? befor = freezed,
    Object? success = freezed,
    Object? error = freezed,
    Object? personalInfo = null,
  }) {
    return _then(
      _$RegisterPersonalEventImpl(
        befor: freezed == befor
            ? _value.befor
            : befor // ignore: cast_nullable_to_non_nullable
                  as dynamic Function(dynamic)?,
        success: freezed == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as dynamic Function(dynamic)?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as dynamic Function(dynamic)?,
        personalInfo: null == personalInfo
            ? _value.personalInfo
            : personalInfo // ignore: cast_nullable_to_non_nullable
                  as PersonalInfoModel,
      ),
    );
  }
}

/// @nodoc

class _$RegisterPersonalEventImpl implements _RegisterPersonalEvent {
  const _$RegisterPersonalEventImpl({
    this.befor,
    this.success,
    this.error,
    required this.personalInfo,
  });

  @override
  final dynamic Function(dynamic)? befor;
  @override
  final dynamic Function(dynamic)? success;
  @override
  final dynamic Function(dynamic)? error;
  @override
  final PersonalInfoModel personalInfo;

  @override
  String toString() {
    return 'LoginEvent.registerPersonal(befor: $befor, success: $success, error: $error, personalInfo: $personalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPersonalEventImpl &&
            (identical(other.befor, befor) || other.befor == befor) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.personalInfo, personalInfo) ||
                other.personalInfo == personalInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, befor, success, error, personalInfo);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPersonalEventImplCopyWith<_$RegisterPersonalEventImpl>
  get copyWith =>
      __$$RegisterPersonalEventImplCopyWithImpl<_$RegisterPersonalEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )
    loginInit,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )
    registerPersonal,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )
    documentInfo,
  }) {
    return registerPersonal(befor, success, error, personalInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )?
    loginInit,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )?
    registerPersonal,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )?
    documentInfo,
  }) {
    return registerPersonal?.call(befor, success, error, personalInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )?
    loginInit,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )?
    registerPersonal,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )?
    documentInfo,
    required TResult orElse(),
  }) {
    if (registerPersonal != null) {
      return registerPersonal(befor, success, error, personalInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_LoginInitEvent value) loginInit,
    required TResult Function(_RegisterPersonalEvent value) registerPersonal,
    required TResult Function(_DocumentInfoEvent value) documentInfo,
  }) {
    return registerPersonal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_LoginInitEvent value)? loginInit,
    TResult? Function(_RegisterPersonalEvent value)? registerPersonal,
    TResult? Function(_DocumentInfoEvent value)? documentInfo,
  }) {
    return registerPersonal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_LoginInitEvent value)? loginInit,
    TResult Function(_RegisterPersonalEvent value)? registerPersonal,
    TResult Function(_DocumentInfoEvent value)? documentInfo,
    required TResult orElse(),
  }) {
    if (registerPersonal != null) {
      return registerPersonal(this);
    }
    return orElse();
  }
}

abstract class _RegisterPersonalEvent implements LoginEvent {
  const factory _RegisterPersonalEvent({
    final dynamic Function(dynamic)? befor,
    final dynamic Function(dynamic)? success,
    final dynamic Function(dynamic)? error,
    required final PersonalInfoModel personalInfo,
  }) = _$RegisterPersonalEventImpl;

  dynamic Function(dynamic)? get befor;
  dynamic Function(dynamic)? get success;
  dynamic Function(dynamic)? get error;
  PersonalInfoModel get personalInfo;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterPersonalEventImplCopyWith<_$RegisterPersonalEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DocumentInfoEventImplCopyWith<$Res> {
  factory _$$DocumentInfoEventImplCopyWith(
    _$DocumentInfoEventImpl value,
    $Res Function(_$DocumentInfoEventImpl) then,
  ) = __$$DocumentInfoEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    dynamic Function(dynamic)? befor,
    dynamic Function(dynamic)? success,
    dynamic Function(dynamic)? error,
    DocumentInfo documentInfo,
  });
}

/// @nodoc
class __$$DocumentInfoEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$DocumentInfoEventImpl>
    implements _$$DocumentInfoEventImplCopyWith<$Res> {
  __$$DocumentInfoEventImplCopyWithImpl(
    _$DocumentInfoEventImpl _value,
    $Res Function(_$DocumentInfoEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? befor = freezed,
    Object? success = freezed,
    Object? error = freezed,
    Object? documentInfo = null,
  }) {
    return _then(
      _$DocumentInfoEventImpl(
        befor: freezed == befor
            ? _value.befor
            : befor // ignore: cast_nullable_to_non_nullable
                  as dynamic Function(dynamic)?,
        success: freezed == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as dynamic Function(dynamic)?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as dynamic Function(dynamic)?,
        documentInfo: null == documentInfo
            ? _value.documentInfo
            : documentInfo // ignore: cast_nullable_to_non_nullable
                  as DocumentInfo,
      ),
    );
  }
}

/// @nodoc

class _$DocumentInfoEventImpl implements _DocumentInfoEvent {
  const _$DocumentInfoEventImpl({
    this.befor,
    this.success,
    this.error,
    required this.documentInfo,
  });

  @override
  final dynamic Function(dynamic)? befor;
  @override
  final dynamic Function(dynamic)? success;
  @override
  final dynamic Function(dynamic)? error;
  @override
  final DocumentInfo documentInfo;

  @override
  String toString() {
    return 'LoginEvent.documentInfo(befor: $befor, success: $success, error: $error, documentInfo: $documentInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentInfoEventImpl &&
            (identical(other.befor, befor) || other.befor == befor) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.documentInfo, documentInfo) ||
                other.documentInfo == documentInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, befor, success, error, documentInfo);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentInfoEventImplCopyWith<_$DocumentInfoEventImpl> get copyWith =>
      __$$DocumentInfoEventImplCopyWithImpl<_$DocumentInfoEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )
    loginInit,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )
    registerPersonal,
    required TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )
    documentInfo,
  }) {
    return documentInfo(befor, success, error, this.documentInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )?
    loginInit,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )?
    registerPersonal,
    TResult? Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )?
    documentInfo,
  }) {
    return documentInfo?.call(befor, success, error, this.documentInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      String userName,
      String password,
    )?
    loginInit,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      PersonalInfoModel personalInfo,
    )?
    registerPersonal,
    TResult Function(
      dynamic Function(dynamic)? befor,
      dynamic Function(dynamic)? success,
      dynamic Function(dynamic)? error,
      DocumentInfo documentInfo,
    )?
    documentInfo,
    required TResult orElse(),
  }) {
    if (documentInfo != null) {
      return documentInfo(befor, success, error, this.documentInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialEvent value) initial,
    required TResult Function(_LoginInitEvent value) loginInit,
    required TResult Function(_RegisterPersonalEvent value) registerPersonal,
    required TResult Function(_DocumentInfoEvent value) documentInfo,
  }) {
    return documentInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialEvent value)? initial,
    TResult? Function(_LoginInitEvent value)? loginInit,
    TResult? Function(_RegisterPersonalEvent value)? registerPersonal,
    TResult? Function(_DocumentInfoEvent value)? documentInfo,
  }) {
    return documentInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialEvent value)? initial,
    TResult Function(_LoginInitEvent value)? loginInit,
    TResult Function(_RegisterPersonalEvent value)? registerPersonal,
    TResult Function(_DocumentInfoEvent value)? documentInfo,
    required TResult orElse(),
  }) {
    if (documentInfo != null) {
      return documentInfo(this);
    }
    return orElse();
  }
}

abstract class _DocumentInfoEvent implements LoginEvent {
  const factory _DocumentInfoEvent({
    final dynamic Function(dynamic)? befor,
    final dynamic Function(dynamic)? success,
    final dynamic Function(dynamic)? error,
    required final DocumentInfo documentInfo,
  }) = _$DocumentInfoEventImpl;

  dynamic Function(dynamic)? get befor;
  dynamic Function(dynamic)? get success;
  dynamic Function(dynamic)? get error;
  DocumentInfo get documentInfo;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentInfoEventImplCopyWith<_$DocumentInfoEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
