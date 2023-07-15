import 'package:flutter/material.dart';

import 'find_word.dart';

class SimilarWord extends StatelessWidget {
  const SimilarWord({
    super.key,
    required this.words,
    required this.index,
    required this.easteregg,
  });

  final List words;
  final int index;
  final String easteregg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        findWord((words[0].length > 0) ? words[0][index] : easteregg, context);
      },
      child: Text(
        (words[0].length > 0) ? words[0][index] : easteregg,
        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
      ),
    );
  }
}
