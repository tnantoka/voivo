//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DefaultApi {
  DefaultApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Accent Phrases
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] text (required):
  ///
  /// * [int] speaker (required):
  Future<Response> accentPhrasesAccentPhrasesPostWithHttpInfo(String text, int speaker) async {
    // Verify required params are set.
    if (text == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: text');
    }
    if (speaker == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: speaker');
    }

    final path = r'/accent_phrases';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'text', text));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'speaker', speaker));

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Accent Phrases
  ///
  /// Parameters:
  ///
  /// * [String] text (required):
  ///
  /// * [int] speaker (required):
  Future<List<AccentPhrase>> accentPhrasesAccentPhrasesPost(String text, int speaker) async {
    final response = await accentPhrasesAccentPhrasesPostWithHttpInfo(text, speaker);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return (await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'List<AccentPhrase>') as List)
        .cast<AccentPhrase>()
        .toList(growable: false);
    }
    return Future<List<AccentPhrase>>.value(null);
  }

  /// Audio Query
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] text (required):
  ///
  /// * [int] speaker (required):
  Future<Response> audioQueryAudioQueryPostWithHttpInfo(String text, int speaker) async {
    // Verify required params are set.
    if (text == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: text');
    }
    if (speaker == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: speaker');
    }

    final path = r'/audio_query';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'text', text));
      queryParams.addAll(_convertParametersForCollectionFormat('', 'speaker', speaker));

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Audio Query
  ///
  /// Parameters:
  ///
  /// * [String] text (required):
  ///
  /// * [int] speaker (required):
  Future<AudioQuery> audioQueryAudioQueryPost(String text, int speaker) async {
    final response = await audioQueryAudioQueryPostWithHttpInfo(text, speaker);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AudioQuery',) as AudioQuery;
        }
    return Future<AudioQuery>.value(null);
  }

  /// Mora Pitch
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] speaker (required):
  ///
  /// * [List<AccentPhrase>] accentPhrase (required):
  Future<Response> moraPitchMoraPitchPostWithHttpInfo(int speaker, List<AccentPhrase> accentPhrase) async {
    // Verify required params are set.
    if (speaker == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: speaker');
    }
    if (accentPhrase == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: accentPhrase');
    }

    final path = r'/mora_pitch';

    Object postBody = accentPhrase;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'speaker', speaker));

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Mora Pitch
  ///
  /// Parameters:
  ///
  /// * [int] speaker (required):
  ///
  /// * [List<AccentPhrase>] accentPhrase (required):
  Future<List<AccentPhrase>> moraPitchMoraPitchPost(int speaker, List<AccentPhrase> accentPhrase) async {
    final response = await moraPitchMoraPitchPostWithHttpInfo(speaker, accentPhrase);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return (await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'List<AccentPhrase>') as List)
        .cast<AccentPhrase>()
        .toList(growable: false);
    }
    return Future<List<AccentPhrase>>.value(null);
  }

  /// Synthesis
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] speaker (required):
  ///
  /// * [AudioQuery] audioQuery (required):
  Future<Response> synthesisSynthesisPostWithHttpInfo(int speaker, AudioQuery audioQuery) async {
    // Verify required params are set.
    if (speaker == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: speaker');
    }
    if (audioQuery == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: audioQuery');
    }

    final path = r'/synthesis';

    Object postBody = audioQuery;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_convertParametersForCollectionFormat('', 'speaker', speaker));

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Synthesis
  ///
  /// Parameters:
  ///
  /// * [int] speaker (required):
  ///
  /// * [AudioQuery] audioQuery (required):
  Future<MultipartFile> synthesisSynthesisPost(int speaker, AudioQuery audioQuery) async {
    final response = await synthesisSynthesisPostWithHttpInfo(speaker, audioQuery);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultipartFile',) as MultipartFile;
        }
    return Future<MultipartFile>.value(null);
  }

  /// Version
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> versionVersionGetWithHttpInfo() async {
    final path = r'/version';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];


    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Version
  Future<Object> versionVersionGet() async {
    final response = await versionVersionGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
        }
    return Future<Object>.value(null);
  }
}
