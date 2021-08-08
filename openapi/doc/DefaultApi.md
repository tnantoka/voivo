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
> List<AccentPhrase> accentPhrasesAccentPhrasesPost(text, speaker)

Accent Phrases

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final text = text_example; // String | 
final speaker = 56; // int | 

try { 
    final result = api_instance.accentPhrasesAccentPhrasesPost(text, speaker);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->accentPhrasesAccentPhrasesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **text** | **String**|  | 
 **speaker** | **int**|  | 

### Return type

[**List<AccentPhrase>**](AccentPhrase.md)

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

final api_instance = DefaultApi();
final text = text_example; // String | 
final speaker = 56; // int | 

try { 
    final result = api_instance.audioQueryAudioQueryPost(text, speaker);
    print(result);
} catch (e) {
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
> List<AccentPhrase> moraPitchMoraPitchPost(speaker, accentPhrase)

Mora Pitch

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final speaker = 56; // int | 
final accentPhrase = [List<AccentPhrase>()]; // List<AccentPhrase> | 

try { 
    final result = api_instance.moraPitchMoraPitchPost(speaker, accentPhrase);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->moraPitchMoraPitchPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **speaker** | **int**|  | 
 **accentPhrase** | [**List<AccentPhrase>**](AccentPhrase.md)|  | 

### Return type

[**List<AccentPhrase>**](AccentPhrase.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **synthesisSynthesisPost**
> MultipartFile synthesisSynthesisPost(speaker, audioQuery)

Synthesis

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final speaker = 56; // int | 
final audioQuery = AudioQuery(); // AudioQuery | 

try { 
    final result = api_instance.synthesisSynthesisPost(speaker, audioQuery);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->synthesisSynthesisPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **speaker** | **int**|  | 
 **audioQuery** | [**AudioQuery**](AudioQuery.md)|  | 

### Return type

[**MultipartFile**](MultipartFile.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: audio/wav, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **versionVersionGet**
> Object versionVersionGet()

Version

### Example 
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();

try { 
    final result = api_instance.versionVersionGet();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->versionVersionGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

