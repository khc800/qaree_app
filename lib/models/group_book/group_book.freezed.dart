// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupBook _$GroupBookFromJson(Map<String, dynamic> json) {
  return _GroupBook.fromJson(json);
}

/// @nodoc
mixin _$GroupBook {
  StartEndDate get startEndDate => throw _privateConstructorUsedError;
  String get bookId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupBookCopyWith<GroupBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupBookCopyWith<$Res> {
  factory $GroupBookCopyWith(GroupBook value, $Res Function(GroupBook) then) =
      _$GroupBookCopyWithImpl<$Res, GroupBook>;
  @useResult
  $Res call({StartEndDate startEndDate, String bookId});

  $StartEndDateCopyWith<$Res> get startEndDate;
}

/// @nodoc
class _$GroupBookCopyWithImpl<$Res, $Val extends GroupBook>
    implements $GroupBookCopyWith<$Res> {
  _$GroupBookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startEndDate = null,
    Object? bookId = null,
  }) {
    return _then(_value.copyWith(
      startEndDate: null == startEndDate
          ? _value.startEndDate
          : startEndDate // ignore: cast_nullable_to_non_nullable
              as StartEndDate,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StartEndDateCopyWith<$Res> get startEndDate {
    return $StartEndDateCopyWith<$Res>(_value.startEndDate, (value) {
      return _then(_value.copyWith(startEndDate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GroupBookCopyWith<$Res> implements $GroupBookCopyWith<$Res> {
  factory _$$_GroupBookCopyWith(
          _$_GroupBook value, $Res Function(_$_GroupBook) then) =
      __$$_GroupBookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StartEndDate startEndDate, String bookId});

  @override
  $StartEndDateCopyWith<$Res> get startEndDate;
}

/// @nodoc
class __$$_GroupBookCopyWithImpl<$Res>
    extends _$GroupBookCopyWithImpl<$Res, _$_GroupBook>
    implements _$$_GroupBookCopyWith<$Res> {
  __$$_GroupBookCopyWithImpl(
      _$_GroupBook _value, $Res Function(_$_GroupBook) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startEndDate = null,
    Object? bookId = null,
  }) {
    return _then(_$_GroupBook(
      startEndDate: null == startEndDate
          ? _value.startEndDate
          : startEndDate // ignore: cast_nullable_to_non_nullable
              as StartEndDate,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroupBook implements _GroupBook {
  _$_GroupBook({required this.startEndDate, required this.bookId});

  factory _$_GroupBook.fromJson(Map<String, dynamic> json) =>
      _$$_GroupBookFromJson(json);

  @override
  final StartEndDate startEndDate;
  @override
  final String bookId;

  @override
  String toString() {
    return 'GroupBook(startEndDate: $startEndDate, bookId: $bookId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroupBook &&
            (identical(other.startEndDate, startEndDate) ||
                other.startEndDate == startEndDate) &&
            (identical(other.bookId, bookId) || other.bookId == bookId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startEndDate, bookId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GroupBookCopyWith<_$_GroupBook> get copyWith =>
      __$$_GroupBookCopyWithImpl<_$_GroupBook>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupBookToJson(
      this,
    );
  }
}

abstract class _GroupBook implements GroupBook {
  factory _GroupBook(
      {required final StartEndDate startEndDate,
      required final String bookId}) = _$_GroupBook;

  factory _GroupBook.fromJson(Map<String, dynamic> json) =
      _$_GroupBook.fromJson;

  @override
  StartEndDate get startEndDate;
  @override
  String get bookId;
  @override
  @JsonKey(ignore: true)
  _$$_GroupBookCopyWith<_$_GroupBook> get copyWith =>
      throw _privateConstructorUsedError;
}
