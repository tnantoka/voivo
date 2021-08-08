# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accentPhrasesAccentPhrasesPost**](DefaultApi.md#accentphrasesaccentphrasespost) | **POST** /accent_phrases | Accent Phrases
[**audioQueryAudioQueryPost**](DefaultApi.md#audioqueryaudioquerypost) | **POST** /audio_query | Audio Query
[**moraPitchMoraPitchPost**](DefaultApi.md#morapitchmorapitchpost) | **POST** /mora_pitch | Mora Pitch
[**synthesisSynthesisPost**](DefaultApi.md#synthesissynthesispost) | **POST** /synthesis | Synthesis
[**versionVersionGet**](DefaultApi.md#versionversionget) | **GET** /version | Version


# **accentPhrasesAccentPhrasesPost**
> BuiltList<AccentPhrase> accentPhrasesAccentPhrasesPost(text, speaker)

Accent Phrases

### Example 
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDefaultApi();
final String text = text_example; // String | 
final int speaker = 56; // int | 

try { 
    final response = api.accentPhrasesAccentPhrasesPost(text, speaker);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->accentPhrasesAccentPhrasesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **text** | **String**|  | 
 **speaker** | **int**|  | 

### Return type

[**BuiltList&lt;AccentPhrase&gt;**](AccentPhrase.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **audioQueryAudioQueryPost**
> AudioQuery audioQueryAudioQueryPost(text, speaker)

Audio Query

### Example 
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDefaultApi();
final String text = text_example; // String | 
final int speaker = 56; // int | 

try { 
    final response = api.audioQueryAudioQueryPost(text, speaker);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->audioQueryAudioQueryPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **text** | **String**|  | 
 **speaker** | **int**|  | 

### Return type

[**AudioQuery**](AudioQuery.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **moraPitchMoraPitchPost**
> BuiltList<AccentPhrase> moraPitchMoraPitchPost(speaker, accentPhrase)

Mora Pitch

### Example 
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDefaultApi();
final int speaker = 56; // int | 
final BuiltList<AccentPhrase> accentPhrase = ; // BuiltList<AccentPhrase> | 

try { 
    final response = api.moraPitchMoraPitchPost(speaker, accentPhrase);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->moraPitchMoraPitchPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **speaker** | **int**|  | 
 **accentPhrase** | [**BuiltList&lt;AccentPhrase&gt;**](AccentPhrase.md)|  | 

### Return type

[**BuiltList&lt;AccentPhrase&gt;**](AccentPhrase.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **synthesisSynthesisPost**
> Uint8List synthesisSynthesisPost(speaker, audioQuery)

Synthesis

### Example 
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDefaultApi();
final int speaker = 56; // int | 
final AudioQuery audioQuery = ; // AudioQuery | 

try { 
    final response = api.synthesisSynthesisPost(speaker, audioQuery);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->synthesisSynthesisPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **speaker** | **int**|  | 
 **audioQuery** | [**AudioQuery**](AudioQuery.md)|  | 

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: audio/wav, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **versionVersionGet**
> JsonObject versionVersionGet()

Version

### Example 
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDefaultApi();

try { 
    final response = api.versionVersionGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->versionVersionGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

