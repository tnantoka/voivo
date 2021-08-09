import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/audio_item.dart';

class AudioAccentForm extends HookConsumerWidget {
  const AudioAccentForm({Key? key, required this.audioItem}) : super(key: key);

  final AudioItem audioItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(child: const Text('accent'));
  }
}
