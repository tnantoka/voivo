//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class HTTPValidationError {
  /// Returns a new [HTTPValidationError] instance.
  HTTPValidationError({
    this.detail = const [],
  });

  List<ValidationError> detail;

  @override
  bool operator ==(Object other) => identical(this, other) || other is HTTPValidationError &&
     other.detail == detail;

  @override
  int get hashCode =>
    (detail == null ? 0 : detail.hashCode);

  @override
  String toString() => 'HTTPValidationError[detail=$detail]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (detail != null) {
      json[r'detail'] = detail;
    }
    return json;
  }

  /// Returns a new [HTTPValidationError] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static HTTPValidationError fromJson(Map<String, dynamic> json) => json == null
    ? null
    : HTTPValidationError(
        detail: ValidationError.listFromJson(json[r'detail']),
    );

  static List<HTTPValidationError> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <HTTPValidationError>[]
      : json.map((dynamic value) => HTTPValidationError.fromJson(value)).toList(growable: true == growable);

  static Map<String, HTTPValidationError> mapFromJson(Map<String, dynamic> json) {
    final map = <String, HTTPValidationError>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = HTTPValidationError.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of HTTPValidationError-objects as value to a dart map
  static Map<String, List<HTTPValidationError>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<HTTPValidationError>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = HTTPValidationError.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

