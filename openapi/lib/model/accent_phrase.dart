//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AccentPhrase {
  /// Returns a new [AccentPhrase] instance.
  AccentPhrase({
    this.moras = const [],
    @required this.accent,
    this.pauseMora,
  });

  List<Mora> moras;

  int accent;

  Mora pauseMora;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AccentPhrase &&
     other.moras == moras &&
     other.accent == accent &&
     other.pauseMora == pauseMora;

  @override
  int get hashCode =>
    (moras == null ? 0 : moras.hashCode) +
    (accent == null ? 0 : accent.hashCode) +
    (pauseMora == null ? 0 : pauseMora.hashCode);

  @override
  String toString() => 'AccentPhrase[moras=$moras, accent=$accent, pauseMora=$pauseMora]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'moras'] = moras;
      json[r'accent'] = accent;
    if (pauseMora != null) {
      json[r'pause_mora'] = pauseMora;
    }
    return json;
  }

  /// Returns a new [AccentPhrase] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static AccentPhrase fromJson(Map<String, dynamic> json) => json == null
    ? null
    : AccentPhrase(
        moras: Mora.listFromJson(json[r'moras']),
        accent: json[r'accent'],
        pauseMora: Mora.fromJson(json[r'pause_mora']),
    );

  static List<AccentPhrase> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <AccentPhrase>[]
      : json.map((dynamic value) => AccentPhrase.fromJson(value)).toList(growable: true == growable);

  static Map<String, AccentPhrase> mapFromJson(Map<String, dynamic> json) {
    final map = <String, AccentPhrase>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = AccentPhrase.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of AccentPhrase-objects as value to a dart map
  static Map<String, List<AccentPhrase>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<AccentPhrase>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = AccentPhrase.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

