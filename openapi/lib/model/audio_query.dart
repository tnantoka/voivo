//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AudioQuery {
  /// Returns a new [AudioQuery] instance.
  AudioQuery({
    this.accentPhrases = const [],
    @required this.speedScale,
    @required this.pitchScale,
    @required this.intonationScale,
  });

  List<AccentPhrase> accentPhrases;

  num speedScale;

  num pitchScale;

  num intonationScale;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AudioQuery &&
     other.accentPhrases == accentPhrases &&
     other.speedScale == speedScale &&
     other.pitchScale == pitchScale &&
     other.intonationScale == intonationScale;

  @override
  int get hashCode =>
    (accentPhrases == null ? 0 : accentPhrases.hashCode) +
    (speedScale == null ? 0 : speedScale.hashCode) +
    (pitchScale == null ? 0 : pitchScale.hashCode) +
    (intonationScale == null ? 0 : intonationScale.hashCode);

  @override
  String toString() => 'AudioQuery[accentPhrases=$accentPhrases, speedScale=$speedScale, pitchScale=$pitchScale, intonationScale=$intonationScale]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'accent_phrases'] = accentPhrases;
      json[r'speedScale'] = speedScale;
      json[r'pitchScale'] = pitchScale;
      json[r'intonationScale'] = intonationScale;
    return json;
  }

  /// Returns a new [AudioQuery] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static AudioQuery fromJson(Map<String, dynamic> json) => json == null
    ? null
    : AudioQuery(
        accentPhrases: AccentPhrase.listFromJson(json[r'accent_phrases']),
        speedScale: json[r'speedScale'] == null ?
          null :
          json[r'speedScale'].toDouble(),
        pitchScale: json[r'pitchScale'] == null ?
          null :
          json[r'pitchScale'].toDouble(),
        intonationScale: json[r'intonationScale'] == null ?
          null :
          json[r'intonationScale'].toDouble(),
    );

  static List<AudioQuery> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <AudioQuery>[]
      : json.map((dynamic value) => AudioQuery.fromJson(value)).toList(growable: true == growable);

  static Map<String, AudioQuery> mapFromJson(Map<String, dynamic> json) {
    final map = <String, AudioQuery>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) => map[key] = AudioQuery.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of AudioQuery-objects as value to a dart map
  static Map<String, List<AudioQuery>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<AudioQuery>>{};
    if (json?.isNotEmpty == true) {
      json.forEach((key, value) {
        map[key] = AudioQuery.listFromJson(value, emptyIsNull: emptyIsNull, growable: growable,);
      });
    }
    return map;
  }
}

