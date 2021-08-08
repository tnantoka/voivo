//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Mora {
  /// Returns a new [Mora] instance.
  Mora({
    @required this.text,
    this.consonant,
    @required this.vowel,
    @required this.pitch,
  });

  String text;

  String consonant;

  String vowel;

  num pitch;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Mora &&
     other.text == text &&
     other.consonant == consonant &&
     other.vowel == vowel &&
     other.pitch == pitch;

  @override
  int get hashCode =>
    (text == null ? 0 : text.hashCode) +
    (consonant == null ? 0 : consonant.hashCode) +
    (vowel == null ? 0 : vowel.hashCode) +
    (pitch == null ? 0 : pitch.hashCode);

  @override
  String toString() => 'Mora[text=$text, consonant=$consonant, vowel=$vowel, pitch=$pitch]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'text'] = text;
    if (consonant != null) {
      json[r'consonant'] = consonant;
    }
      json[r'vowel'] = vowel;
      json[r'pitch'] = pitch;
    return json;
  }

  /// Returns a new [Mora] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static Mora fromJson(Map<String, dynamic> json) => json == null
    ? null
    : Mora(
        text: json[r'text'],
        consonant: json[r'consonant'],
        vowel: json[r'vowel'],
        pitch: json[r'pitch'] == null ?
          null :
          json[r'pitch'].toDouble(),
    );

  static List<Mora> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <Mora>[]
      : json.map((dynamic value) => Mora.fromJson(value)).toList(growable: true == growable);

  static Map<String, Mora> mapFromJson(Map<String, dynamic> json) {
    final map = <String, Mora>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = Mora.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of Mora-objects as value to a dart map
  static Map<String, List<Mora>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<Mora>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = Mora.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

