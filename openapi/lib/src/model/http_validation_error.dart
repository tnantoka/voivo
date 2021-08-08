//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/validation_error.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'http_validation_error.g.dart';

/// HTTPValidationError
///
/// Properties:
/// * [detail] 
abstract class HTTPValidationError implements Built<HTTPValidationError, HTTPValidationErrorBuilder> {
    @BuiltValueField(wireName: r'detail')
    BuiltList<ValidationError>? get detail;

    HTTPValidationError._();

    static void _initializeBuilder(HTTPValidationErrorBuilder b) => b;

    factory HTTPValidationError([void updates(HTTPValidationErrorBuilder b)]) = _$HTTPValidationError;

    @BuiltValueSerializer(custom: true)
    static Serializer<HTTPValidationError> get serializer => _$HTTPValidationErrorSerializer();
}

class _$HTTPValidationErrorSerializer implements StructuredSerializer<HTTPValidationError> {
    @override
    final Iterable<Type> types = const [HTTPValidationError, _$HTTPValidationError];

    @override
    final String wireName = r'HTTPValidationError';

    @override
    Iterable<Object?> serialize(Serializers serializers, HTTPValidationError object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.detail != null) {
            result
                ..add(r'detail')
                ..add(serializers.serialize(object.detail,
                    specifiedType: const FullType(BuiltList, [FullType(ValidationError)])));
        }
        return result;
    }

    @override
    HTTPValidationError deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = HTTPValidationErrorBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            switch (key) {
                case r'detail':
                    result.detail.replace(serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(ValidationError)])) as BuiltList<ValidationError>);
                    break;
            }
        }
        return result.build();
    }
}

