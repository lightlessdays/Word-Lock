import 'package:dictionary/ui/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../fetch/constants.dart';

// ignore: must_be_immutable
class Word extends StatefulWidget {
  String word;
  List list;

  Word(this.word, this.list, {super.key});

  @override
  State<Word> createState() => _WordState();
}

final player1 = AudioPlayer();
int listLength = 1;
int selectedMeaning = 0;
List loopingList = [];
String pronunciation = " ";
String audioURL = "notexisting";
bool partOfSpeechDoesNotExist = false;

class _WordState extends State<Word> {
  @override
  void initState() {
    try {
      if (widget.list[0][0]["fl"] == null) {
        widget.list[0][0]["fl"] = widget.list[0][1]["fl"];
      }
    } catch (e) {
      partOfSpeechDoesNotExist = true;
    }
    loopingList = [];
    pronunciation = " ";
    listLength = 1;
    selectedMeaning = 0;
    audioURL = "notexisting";
    for (int i = 0; i < 2; i++) {
      try {
        // ignore: unused_local_variable
        String a = widget.list[0][i + 1]["fl"];
        if ((widget.list[0][i + 1]["fl"]) == null) {
          throw Exception();
        }
        loopingList.add(i + 1);
      } catch (e) {
        break;
      }
    }

    try {
      pronunciation = widget.list[0][0]["hwi"]["prs"][0]["mw"];
      // ignore: empty_catches
    } catch (e) {}

    try {
      audioSetter();
      // ignore: empty_catches
    } catch (e) {}
    super.initState();
  }

  Future<void> audioSetter() async {
    audioURL =
        fetchAudioURL(widget.list[0][0]["hwi"]["prs"][0]["sound"]["audio"]);
    await player1.setUrl(audioURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: backgroundColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.word,
                style: const TextStyle(
                    fontFamily: "Title",
                    fontSize: 48,
                    fontWeight: FontWeight.w800),
              ),
              (pronunciation != " ")
                  ? Row(
                      children: [
                        Text(
                          pronunciation,
                          style: const TextStyle(
                              fontFamily: "SansSerifReg",
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          onPressed: () async {
                            if (audioURL != "notexisting") {
                              await player1.setClip(
                                  start: const Duration(seconds: 0));
                              await player1.play();
                              await player1.stop();
                            }
                          },
                          icon: const Icon(
                            Icons.volume_up,
                          ),
                        )
                      ],
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              const SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    (partOfSpeechDoesNotExist)
                        ? const SizedBox(
                            height: 0,
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMeaning = 0;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: (selectedMeaning == 0)
                                      ? Colors.black
                                      : Colors.transparent,
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(
                                  widget.list[0][0]["fl"],
                                  style: TextStyle(
                                      color: (selectedMeaning == 0)
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                    (loopingList.contains(2))
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMeaning = 2;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: const Border.symmetric(
                                    vertical: BorderSide.none,
                                    horizontal: BorderSide(width: 1)),
                                color: (selectedMeaning == 2)
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(widget.list[0][2]["fl"],
                                    style: TextStyle(
                                        color: (selectedMeaning == 2)
                                            ? Colors.white
                                            : Colors.black)),
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                    (loopingList.contains(1))
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedMeaning = 1;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: (selectedMeaning == 1)
                                    ? Colors.black
                                    : Colors.transparent,
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(widget.list[0][1]["fl"],
                                    style: TextStyle(
                                        color: (selectedMeaning == 1)
                                            ? Colors.white
                                            : Colors.black)),
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.list[0][selectedMeaning]["shortdef"].length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Text("${index + 1}"),
                      title: SelectableText(
                        widget.list[0][selectedMeaning]["shortdef"][index],
                        style: const TextStyle(
                            fontFamily: "sansSerif", fontSize: 16),
                      ),
                    );
                  }),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
