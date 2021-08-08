//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/accent_phrase.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'audio_query.g.dart';

/// AudioQuery
///
/// Properties:
/// * [accentPhrases] 
/// * [speedScale] 
/// * [pitchScale] 
/// * [intonationScale] 
abstract class AudioQuery implements Built<AudioQuery, AudioQueryBuilder> {
    @BuiltValueField(wireName: r'accent_phrases')
    BuiltList<AccentPhrase> get accentPhrases;

    @BuiltValueField(wireName: r'speedScale')
    num get speedScale;

    @BuiltValueField(wireName: r'pitchScale')
    num get pitchScale;

    @BuiltValueField(wireName: r'intonationScale')
    num get intonationScale;

    AudioQuery._();

    static void _initializeBuilder(AudioQueryBuilder b) => b;

    factory AudioQuery([void updates(AudioQueryBuilder b)]) = _$AudioQuery;

    @BuiltValueSerializer(custom: true)
    static Serializer<AudioQuery> get serializer => _$AudioQuerySerializer();
}

class _$AudioQuerySerializer implements StructuredSerializer<AudioQuery> {
    @override
    final Iterable<Type> types = const [AudioQuery, _$AudioQuery];

    @override
    final String wireName = r'AudioQuery';

    @override
    Iterable<Object?> serialize(Serializers serializers, AudioQuery object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'accent_phrases')
            ..add(serializers.serialize(object.accentPhrases,
                specifiedType: const FullType(BuiltList, [FullType(AccentPhrase)])));
        result
            ..add(r'speedScale')
            ..add(serializers.serialize(object.speedScale,
                specifiedType: const FullType(num)));
        result
            ..add(r'pitchScale')
            ..add(serializers.serialize(object.pitchScale,
                specifiedType: const FullType(num)));
        result
            ..add(r'intonationScale')
            ..add(serializers.serialize(object.intonationScale,
                specifiedType: const FullType(num)));
        return result;
    }

    @override
    AudioQuery deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = AudioQueryBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'accent_phrases':
                    result.accentPhrases.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(AccentPhrase)])) as BuiltList<AccentPhrase>);
                    break;
                case r'speedScale':
                    result.speedScale = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    break;
                case r'pitchScale':
                    result.pitchScale = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    break;
                case r'intonationScale':
                    result.intonationScale = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    break;
            }
        }
        return result.build();
    }
}

