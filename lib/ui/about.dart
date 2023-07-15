import 'package:flutter/material.dart';

import '../fetch/fetch_data.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.developer_board),
              title: Text(
                "\nCreated with ❤️ by Dhruv Badaya",
                style: TextStyle(
                    fontFamily: "sansSerif",
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
              subtitle: Text("\nI do not generate any profit from this app. I need your support to keep this app running free. Buy me a coffee to support me.\n",style: TextStyle(fontFamily: "sansSerif"),),
            ),
            AboutListTile(
              url: 'https://dhruvbadaya.com/coffee',
              icon: Icon(Icons.coffee_outlined),
              title: 'Buy me a Coffee',
            ),
            AboutListTile(
              url: 'https://dhruvbadaya.com',
              icon: Icon(Icons.code),
              title: 'View Developer Website',
            ),
            AboutListTile(
              url: 'https://dhruvbadaya.com/contact',
              icon: Icon(Icons.mail_outline),
              title: 'Hire me for a Project',
            ),
            AboutListTile(
              url: 'https://dhruvbadaya.com/reportbug',
              icon: Icon(Icons.bug_report_outlined),
              title: 'Report a bug',
            ),
          ],
        ),
      ),
    );
  }
}

class AboutListTile extends StatelessWidget {
  const AboutListTile({
    super.key,
    required this.url,
    required this.icon,
    required this.title,
  });

  final String url;
  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrlInBrowser(Uri.parse(url));
      },
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(
              fontFamily: "sansSerif",
              fontWeight: FontWeight.w100,
              fontSize: 18),
        ),
      ),
    );
  }
}
