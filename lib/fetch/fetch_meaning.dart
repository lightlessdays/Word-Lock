import 'dart:math';

import 'package:dictionary/fetch/constants.dart';
import 'package:dictionary/fetch/fetch_data.dart';

Future<List> getWordMeanings(String word) async {
  List getData=(await fetchData(word, (Random().nextBool())?apiKey1:apiKey2));


  //finding if the word exists or not
  try{
    getData[0]["meta"];
  }catch(e){
    return ["notfound",getData];
  }

  //this will be executed if the word exists
  return ["found",getData];
}

