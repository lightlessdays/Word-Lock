import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../fetch/fetch_meaning.dart';
import '../ui/word.dart';
import '../ui/wordnotfound.dart';

Future<void> findWord(String text, BuildContext context) async {
  EasyLoading.show(status: 'looking up...');
  List meaning = await getWordMeanings(text);
  EasyLoading.dismiss();
  if (meaning[0] == "found") {
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Word(text, [meaning[1]])),
    );
  } else {
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WordNotFound([meaning[1]])),
    );
  }
}
