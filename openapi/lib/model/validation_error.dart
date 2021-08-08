//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ValidationError {
  /// Returns a new [ValidationError] instance.
  ValidationError({
    this.loc = const [],
    @required this.msg,
    @required this.type,
  });

  List<String> loc;

  String msg;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ValidationError &&
     other.loc == loc &&
     other.msg == msg &&
     other.type == type;

  @override
  int get hashCode =>
    (loc == null ? 0 : loc.hashCode) +
    (msg == null ? 0 : msg.hashCode) +
    (type == null ? 0 : type.hashCode);

  @override
  String toString() => 'ValidationError[loc=$loc, msg=$msg, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'loc'] = loc;
      json[r'msg'] = msg;
      json[r'type'] = type;
    return json;
  }

  /// Returns a new [ValidationError] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ValidationError fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ValidationError(
        loc: json[r'loc'] == null
          ? null
          : (json[r'loc'] as List).cast<String>(),
        msg: json[r'msg'],
        type: json[r'type'],
    );

  static List<ValidationError> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ValidationError>[]
      : json.map((dynamic value) => ValidationError.fromJson(value)).toList(growable: true == growable);

  static Map<String, ValidationError> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ValidationError>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = ValidationError.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of ValidationError-objects as value to a dart map
  static Map<String, List<ValidationError>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ValidationError>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = ValidationError.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

