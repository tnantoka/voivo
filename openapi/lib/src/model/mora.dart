//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mora.g.dart';

/// Mora
///
/// Properties:
/// * [text] 
/// * [consonant] 
/// * [vowel] 
/// * [pitch] 
abstract class Mora implements Built<Mora, MoraBuilder> {
    @BuiltValueField(wireName: r'text')
    String get text;

    @BuiltValueField(wireName: r'consonant')
    String? get consonant;

    @BuiltValueField(wireName: r'vowel')
    String get vowel;

    @BuiltValueField(wireName: r'pitch')
    num get pitch;

    Mora._();

    static void _initializeBuilder(MoraBuilder b) => b;

    factory Mora([void updates(MoraBuilder b)]) = _$Mora;

    @BuiltValueSerializer(custom: true)
    static Serializer<Mora> get serializer => _$MoraSerializer();
}

class _$MoraSerializer implements StructuredSerializer<Mora> {
    @override
    final Iterable<Type> types = const [Mora, _$Mora];

    @override
    final String wireName = r'Mora';

    @override
    Iterable<Object?> serialize(Serializers serializers, Mora object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        result
            ..add(r'text')
            ..add(serializers.serialize(object.text,
                specifiedType: const FullType(String)));
        if (object.consonant != null) {
            result
                ..add(r'consonant')
                ..add(serializers.serialize(object.consonant,
                    specifiedType: const FullType(String)));
        }
        result
            ..add(r'vowel')
            ..add(serializers.serialize(object.vowel,
                specifiedType: const FullType(String)));
        result
            ..add(r'pitch')
            ..add(serializers.serialize(object.pitch,
                specifiedType: const FullType(num)));
        return result;
    }

    @override
    Mora deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = MoraBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'text':
                    result.text = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'consonant':
                    result.consonant = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'vowel':
                    result.vowel = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    break;
                case r'pitch':
                    result.pitch = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    break;
            }
        }
        return result.build();
    }
}

