import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voivo/providers.dart';

import '../models/audio_item.dart';

class AudioGeneralForm extends HookConsumerWidget {
  const AudioGeneralForm({Key? key, required this.audioItem}) : super(key: key);

  final AudioItem audioItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('スピーカー', textScaleFactor: 1.2),
              DropdownButton<int>(
                value: audioItem.speaker,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (nextSpeaker) {
                  ref
                      .read(audioItemListProvider.notifier)
                      .update(id: audioItem.id, speacker: nextSpeaker);
                },
                items: [0, 1].map((speaker) {
                  return DropdownMenuItem(
                    value: speaker,
                    child: Row(children: [
                      CircleAvatar(
                        child: Text('S${speaker}'),
                        radius: 14,
                      ),
                      SizedBox(width: 4),
                      Text('スピーカー $speaker'),
                    ]),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('話速', textScaleFactor: 1.2),
              Row(
                children: [
                  Slider(
                    value: audioItem.speedScale.toDouble(),
                    min: 0.5,
                    max: 2.0,
                    divisions: 15,
                    label: audioItem.speedScale.toStringAsFixed(1),
                    onChanged: (nextSpeedScale) {
                      ref.read(audioItemListProvider.notifier).update(
                          id: audioItem.id,
                          speedScale:
                              double.parse(nextSpeedScale.toStringAsFixed(1)));
                    },
                  ),
                  SizedBox(
                    width: 50,
                    child: Text(
                      audioItem.speedScale.toString(),
                      textScaleFactor: 1.2,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('音高', textScaleFactor: 1.2),
              Row(
                children: [
                  Slider(
                    value: audioItem.pitchScale.toDouble(),
                    min: -0.15,
                    max: 0.15,
                    divisions: 30,
                    label: audioItem.pitchScale.toStringAsFixed(2),
                    onChanged: (nextPitchScale) {
                      ref.read(audioItemListProvider.notifier).update(
                          id: audioItem.id,
                          pitchScale:
                              double.parse(nextPitchScale.toStringAsFixed(2)));
                    },
                  ),
                  SizedBox(
                    width: 50,
                    child: Text(
                      audioItem.pitchScale.toString(),
                      textScaleFactor: 1.2,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('抑揚', textScaleFactor: 1.2),
              Row(
                children: [
                  Slider(
                    value: audioItem.intonationScale.toDouble(),
                    min: 0.0,
                    max: 2.0,
                    label: audioItem.intonationScale.toStringAsFixed(2),
                    onChanged: (nextIntonationScale) {
                      ref.read(audioItemListProvider.notifier).update(
                          id: audioItem.id,
                          intonationScale: double.parse(
                              nextIntonationScale.toStringAsFixed(2)));
                    },
                  ),
                  SizedBox(
                    width: 50,
                    child: Text(
                      audioItem.intonationScale.toString(),
                      textScaleFactor: 1.2,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
