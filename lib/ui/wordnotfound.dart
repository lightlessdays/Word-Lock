import 'package:flutter/material.dart';
import '../methods/similar_word.dart';

// ignore: must_be_immutable
class WordNotFound extends StatelessWidget {
  List words;
  WordNotFound(this.words, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sorry Buddy, We did not find your word. 🥺",
              style: TextStyle(
                fontSize: 35,
                fontFamily: "Title",
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "However, here are three words with similar spellings:",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "sansSerif",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SimilarWord(
                    words: words,
                    index: 0,
                    easteregg: 'what',
                  ),
                  SimilarWord(
                    words: words,
                    index: 1,
                    easteregg: 'the',
                  ),
                  SimilarWord(
                    words: words,
                    index: 2,
                    easteregg: 'word',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
