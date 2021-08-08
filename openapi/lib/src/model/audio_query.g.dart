// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_query.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AudioQuery extends AudioQuery {
  @override
  final BuiltList<AccentPhrase> accentPhrases;
  @override
  final num speedScale;
  @override
  final num pitchScale;
  @override
  final num intonationScale;

  factory _$AudioQuery([void Function(AudioQueryBuilder)? updates]) =>
      (new AudioQueryBuilder()..update(updates)).build();

  _$AudioQuery._(
      {required this.accentPhrases,
      required this.speedScale,
      required this.pitchScale,
      required this.intonationScale})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        accentPhrases, 'AudioQuery', 'accentPhrases');
    BuiltValueNullFieldError.checkNotNull(
        speedScale, 'AudioQuery', 'speedScale');
    BuiltValueNullFieldError.checkNotNull(
        pitchScale, 'AudioQuery', 'pitchScale');
    BuiltValueNullFieldError.checkNotNull(
        intonationScale, 'AudioQuery', 'intonationScale');
  }

  @override
  AudioQuery rebuild(void Function(AudioQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AudioQueryBuilder toBuilder() => new AudioQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AudioQuery &&
        accentPhrases == other.accentPhrases &&
        speedScale == other.speedScale &&
        pitchScale == other.pitchScale &&
        intonationScale == other.intonationScale;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, accentPhrases.hashCode), speedScale.hashCode),
            pitchScale.hashCode),
        intonationScale.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AudioQuery')
          ..add('accentPhrases', accentPhrases)
          ..add('speedScale', speedScale)
          ..add('pitchScale', pitchScale)
          ..add('intonationScale', intonationScale))
        .toString();
  }
}

class AudioQueryBuilder implements Builder<AudioQuery, AudioQueryBuilder> {
  _$AudioQuery? _$v;

  ListBuilder<AccentPhrase>? _accentPhrases;
  ListBuilder<AccentPhrase> get accentPhrases =>
      _$this._accentPhrases ??= new ListBuilder<AccentPhrase>();
  set accentPhrases(ListBuilder<AccentPhrase>? accentPhrases) =>
      _$this._accentPhrases = accentPhrases;

  num? _speedScale;
  num? get speedScale => _$this._speedScale;
  set speedScale(num? speedScale) => _$this._speedScale = speedScale;

  num? _pitchScale;
  num? get pitchScale => _$this._pitchScale;
  set pitchScale(num? pitchScale) => _$this._pitchScale = pitchScale;

  num? _intonationScale;
  num? get intonationScale => _$this._intonationScale;
  set intonationScale(num? intonationScale) =>
      _$this._intonationScale = intonationScale;

  AudioQueryBuilder() {
    AudioQuery._initializeBuilder(this);
  }

  AudioQueryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accentPhrases = $v.accentPhrases.toBuilder();
      _speedScale = $v.speedScale;
      _pitchScale = $v.pitchScale;
      _intonationScale = $v.intonationScale;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AudioQuery other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AudioQuery;
  }

  @override
  void update(void Function(AudioQueryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AudioQuery build() {
    _$AudioQuery _$result;
    try {
      _$result = _$v ??
          new _$AudioQuery._(
              accentPhrases: accentPhrases.build(),
              speedScale: BuiltValueNullFieldError.checkNotNull(
                  speedScale, 'AudioQuery', 'speedScale'),
              pitchScale: BuiltValueNullFieldError.checkNotNull(
                  pitchScale, 'AudioQuery', 'pitchScale'),
              intonationScale: BuiltValueNullFieldError.checkNotNull(
                  intonationScale, 'AudioQuery', 'intonationScale'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'accentPhrases';
        accentPhrases.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AudioQuery', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
