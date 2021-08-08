import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DefaultApi
void main() {
  final instance = Openapi().getDefaultApi();

  group(DefaultApi, () {
    // Accent Phrases
    //
    //Future<BuiltList<AccentPhrase>> accentPhrasesAccentPhrasesPost(String text, int speaker) async
    test('test accentPhrasesAccentPhrasesPost', () async {
      // TODO
    });

    // Audio Query
    //
    //Future<AudioQuery> audioQueryAudioQueryPost(String text, int speaker) async
    test('test audioQueryAudioQueryPost', () async {
      // TODO
    });

    // Mora Pitch
    //
    //Future<BuiltList<AccentPhrase>> moraPitchMoraPitchPost(int speaker, BuiltList<AccentPhrase> accentPhrase) async
    test('test moraPitchMoraPitchPost', () async {
      // TODO
    });

    // Synthesis
    //
    //Future<Uint8List> synthesisSynthesisPost(int speaker, AudioQuery audioQuery) async
    test('test synthesisSynthesisPost', () async {
      // TODO
    });

    // Version
    //
    //Future<JsonObject> versionVersionGet() async
    test('test versionVersionGet', () async {
      // TODO
    });

  });
}
