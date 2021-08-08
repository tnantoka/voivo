//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:openapi/src/model/mora.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'accent_phrase.g.dart';

/// AccentPhrase
///
/// Properties:
/// * [moras] 
/// * [accent] 
/// * [pauseMora] 
abstract class AccentPhrase implements Built<AccentPhrase, AccentPhraseBuilder> {
    @BuiltValueField(wireName: r'moras')
    BuiltList<Mora> get moras;

    @BuiltValueField(wireName: r'accent')
    int get accent;

    @BuiltValueField(wireName: r'pause_mora')
    Mora? get pauseMora;

    AccentPhrase._();

    static void _initializeBuilder(AccentPhraseBuilder b) => b;

    factory AccentPhrase([void updates(AccentPhraseBuilder b)]) = _$AccentPhrase;

    @BuiltValueSerializer(custom: true)
    static Serializer<AccentPhrase> get serializer => _$AccentPhraseSerializer();
}

class _$AccentPhraseSerializer implements StructuredSerializer<AccentPhrase> {
    @override
    final Iterable<Type> types = const [AccentPhrase, _$AccentPhrase];

    @override
    final String wireName = r'AccentPhrase';

    @override
    Iterable<Object?> serialize(Serializers serializers, AccentPhrase object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'moras')
            ..add(serializers.serialize(object.moras,
                specifiedType: const FullType(BuiltList, [FullType(Mora)])));
        result
            ..add(r'accent')
            ..add(serializers.serialize(object.accent,
                specifiedType: const FullType(int)));
        if (object.pauseMora != null) {
            result
                ..add(r'pause_mora')
                ..add(serializers.serialize(object.pauseMora,
                    specifiedType: const FullType(Mora)));
        }
        return result;
    }

    @override
    AccentPhrase deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = AccentPhraseBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'moras':
                    result.moras.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(Mora)])) as BuiltList<Mora>);
                    break;
                case r'accent':
                    result.accent = serializers.deserialize(value,
                        specifiedType: const FullType(int)) as int;
                    break;
                case r'pause_mora':
                    result.pauseMora.replace(serializers.deserialize(value,
                        specifiedType: const FullType(Mora)) as Mora);
                    break;
            }
        }
        return result.build();
    }
}

