// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mora.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Mora extends Mora {
  @override
  final String text;
  @override
  final String? consonant;
  @override
  final String vowel;
  @override
  final num pitch;

  factory _$Mora([void Function(MoraBuilder)? updates]) =>
      (new MoraBuilder()..update(updates)).build();

  _$Mora._(
      {required this.text,
      this.consonant,
      required this.vowel,
      required this.pitch})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(text, 'Mora', 'text');
    BuiltValueNullFieldError.checkNotNull(vowel, 'Mora', 'vowel');
    BuiltValueNullFieldError.checkNotNull(pitch, 'Mora', 'pitch');
  }

  @override
  Mora rebuild(void Function(MoraBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MoraBuilder toBuilder() => new MoraBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Mora &&
        text == other.text &&
        consonant == other.consonant &&
        vowel == other.vowel &&
        pitch == other.pitch;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, text.hashCode), consonant.hashCode), vowel.hashCode),
        pitch.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Mora')
          ..add('text', text)
          ..add('consonant', consonant)
          ..add('vowel', vowel)
          ..add('pitch', pitch))
        .toString();
  }
}

class MoraBuilder implements Builder<Mora, MoraBuilder> {
  _$Mora? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _consonant;
  String? get consonant => _$this._consonant;
  set consonant(String? consonant) => _$this._consonant = consonant;

  String? _vowel;
  String? get vowel => _$this._vowel;
  set vowel(String? vowel) => _$this._vowel = vowel;

  num? _pitch;
  num? get pitch => _$this._pitch;
  set pitch(num? pitch) => _$this._pitch = pitch;

  MoraBuilder() {
    Mora._initializeBuilder(this);
  }

  MoraBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _consonant = $v.consonant;
      _vowel = $v.vowel;
      _pitch = $v.pitch;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Mora other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Mora;
  }

  @override
  void update(void Function(MoraBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Mora build() {
    final _$result = _$v ??
        new _$Mora._(
            text: BuiltValueNullFieldError.checkNotNull(text, 'Mora', 'text'),
            consonant: consonant,
            vowel:
                BuiltValueNullFieldError.checkNotNull(vowel, 'Mora', 'vowel'),
            pitch:
                BuiltValueNullFieldError.checkNotNull(pitch, 'Mora', 'pitch'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
