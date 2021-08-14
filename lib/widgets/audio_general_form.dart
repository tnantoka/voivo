import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/audio_item.dart';
import '../providers.dart';

class AudioGeneralForm extends HookConsumerWidget {
  const AudioGeneralForm({Key? key, required this.audioItem}) : super(key: key);

  final AudioItem audioItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(defaultApiProvider).state;

    final children = [
      ListTile(
        leading: const Text('スピーカー'),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DropdownButton<int>(
              value: audioItem.speaker,
              icon: const Icon(Icons.arrow_drop_down),
              onChanged: (nextSpeaker) async {
                final accentPhrases = await audioItem.fetchAccentPhrases(
                    api, audioItem.text, nextSpeaker!);
                ref.read(audioItemListProvider.notifier).update(
                    id: audioItem.id,
                    speacker: nextSpeaker,
                    accentPhrases: accentPhrases);
              },
              items: [0, 1].map((speaker) {
                return DropdownMenuItem(
                  value: speaker,
                  child: Row(children: [
                    CircleAvatar(
                      child: Text('S$speaker'),
                      radius: 14,
                    ),
                    const SizedBox(width: 4),
                    Text('スピーカー $speaker'),
                  ]),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      ListTile(
        leading: const Text('話速'),
        title: Slider(
          value: audioItem.speedScale.toDouble(),
          min: 0.5,
          max: 2.0,
          divisions: 15,
          label: audioItem.speedScale.toStringAsFixed(1),
          onChanged: (nextSpeedScale) {
            ref.read(audioItemListProvider.notifier).update(
                id: audioItem.id,
                speedScale: double.parse(nextSpeedScale.toStringAsFixed(1)));
          },
        ),
        trailing: Text(
          audioItem.speedScale.toString(),
          textAlign: TextAlign.right,
        ),
      ),
      ListTile(
        leading: const Text('音高'),
        title: Slider(
          value: audioItem.pitchScale.toDouble(),
          min: -0.15,
          max: 0.15,
          divisions: 30,
          label: audioItem.pitchScale.toStringAsFixed(2),
          onChanged: (nextPitchScale) {
            ref.read(audioItemListProvider.notifier).update(
                id: audioItem.id,
                pitchScale: double.parse(nextPitchScale.toStringAsFixed(2)));
          },
        ),
        trailing: Text(
          audioItem.pitchScale.toString(),
          textAlign: TextAlign.right,
        ),
      ),
      ListTile(
        leading: const Text('抑揚'),
        title: Slider(
          value: audioItem.intonationScale.toDouble(),
          min: 0.0,
          max: 2.0,
          label: audioItem.intonationScale.toStringAsFixed(2),
          onChanged: (nextIntonationScale) {
            ref.read(audioItemListProvider.notifier).update(
                id: audioItem.id,
                intonationScale:
                    double.parse(nextIntonationScale.toStringAsFixed(2)));
          },
        ),
        trailing: Text(
          audioItem.intonationScale.toString(),
          textAlign: TextAlign.right,
        ),
      ),
    ];

    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: children.length,
          itemBuilder: (BuildContext context, int index) => children[index],
        ),
      ),
    ); // return Container(
  }
}
