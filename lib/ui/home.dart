import 'package:dictionary/ui/constants/colors.dart';
import 'package:flutter/material.dart';
import '../methods/find_word.dart';
import 'about.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController word = TextEditingController();

  int _selectedIndex = 0;
 //New
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,elevation: 0,toolbarHeight: 0,),
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,         //New
        backgroundColor: backgroundColor,
        elevation: 0,
        selectedIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        items:  const <BottomNavigationBarItem>[
                  //New
          BottomNavigationBarItem(

            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Word Lock",
              style: TextStyle(
                  fontFamily: "Title",
                  fontSize: 40,
                  fontWeight: FontWeight.w900,),
              textAlign: TextAlign.left,
            ),
            const Text(
              "Over 100,000 Definitions and Pronunciations",
              style: TextStyle(
                  fontFamily: "SansSerif",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
              color: Colors.grey,),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'search word',
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    if(word.text.replaceAll(" ", "").isNotEmpty) findWord(word.text, context);
                  },
                ),
                filled: true,
                fillColor: searchBackground,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
              ),
              style: const TextStyle(
                  fontFamily: "SansSerif", fontWeight: FontWeight.w500),
              textInputAction: TextInputAction.search,
              controller: word,
              onSubmitted: (value) {
                if(word.text.replaceAll(" ", "").isNotEmpty) findWord(word.text, context);
              },
            ),
            const SizedBox(height: 25),
        const Text(
          "Powered by Merriam Webster © 2023",
          style: TextStyle(
            fontFamily: "SansSerif",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey,),),
          ],
        ),
      ),
    );

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if(index==1){
      goTo(const About());
    }
    setState(() {
      _selectedIndex=0;
    });
  }

  void goTo(var className){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => className),
    );
  }
}


