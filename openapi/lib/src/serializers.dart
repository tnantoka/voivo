//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/accent_phrase.dart';
import 'package:openapi/src/model/audio_query.dart';
import 'package:openapi/src/model/http_validation_error.dart';
import 'package:openapi/src/model/mora.dart';
import 'package:openapi/src/model/validation_error.dart';

part 'serializers.g.dart';

@SerializersFor([
  AccentPhrase,
  AudioQuery,
  HTTPValidationError,
  Mora,
  ValidationError,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(AccentPhrase)]),
        () => ListBuilder<AccentPhrase>(),
      )
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
