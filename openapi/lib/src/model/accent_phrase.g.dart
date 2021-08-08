// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accent_phrase.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AccentPhrase extends AccentPhrase {
  @override
  final BuiltList<Mora> moras;
  @override
  final int accent;
  @override
  final Mora? pauseMora;

  factory _$AccentPhrase([void Function(AccentPhraseBuilder)? updates]) =>
      (new AccentPhraseBuilder()..update(updates)).build();

  _$AccentPhrase._({required this.moras, required this.accent, this.pauseMora})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(moras, 'AccentPhrase', 'moras');
    BuiltValueNullFieldError.checkNotNull(accent, 'AccentPhrase', 'accent');
  }

  @override
  AccentPhrase rebuild(void Function(AccentPhraseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccentPhraseBuilder toBuilder() => new AccentPhraseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccentPhrase &&
        moras == other.moras &&
        accent == other.accent &&
        pauseMora == other.pauseMora;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, moras.hashCode), accent.hashCode), pauseMora.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccentPhrase')
          ..add('moras', moras)
          ..add('accent', accent)
          ..add('pauseMora', pauseMora))
        .toString();
  }
}

class AccentPhraseBuilder
    implements Builder<AccentPhrase, AccentPhraseBuilder> {
  _$AccentPhrase? _$v;

  ListBuilder<Mora>? _moras;
  ListBuilder<Mora> get moras => _$this._moras ??= new ListBuilder<Mora>();
  set moras(ListBuilder<Mora>? moras) => _$this._moras = moras;

  int? _accent;
  int? get accent => _$this._accent;
  set accent(int? accent) => _$this._accent = accent;

  MoraBuilder? _pauseMora;
  MoraBuilder get pauseMora => _$this._pauseMora ??= new MoraBuilder();
  set pauseMora(MoraBuilder? pauseMora) => _$this._pauseMora = pauseMora;

  AccentPhraseBuilder() {
    AccentPhrase._initializeBuilder(this);
  }

  AccentPhraseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _moras = $v.moras.toBuilder();
      _accent = $v.accent;
      _pauseMora = $v.pauseMora?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccentPhrase other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccentPhrase;
  }

  @override
  void update(void Function(AccentPhraseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccentPhrase build() {
    _$AccentPhrase _$result;
    try {
      _$result = _$v ??
          new _$AccentPhrase._(
              moras: moras.build(),
              accent: BuiltValueNullFieldError.checkNotNull(
                  accent, 'AccentPhrase', 'accent'),
              pauseMora: _pauseMora?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'moras';
        moras.build();

        _$failedField = 'pauseMora';
        _pauseMora?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AccentPhrase', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
