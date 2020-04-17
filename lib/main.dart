/*
 * Copyright © 2020 Akarsh Seggemu. All rights reserved.
 */
import 'package:flutter/material.dart';

import 'package:akarsh_seggemu_resume/ResumeLayout.dart';
import 'package:akarsh_seggemu_resume/DownloadHelper.dart';
import 'package:akarsh_seggemu_resume/DocumentHelper.dart';

void main() => runApp(MaterialApp(home: MyApp()));

// List of resume language names
final List<String> resumeNames = <String>[
  'English resume',
  'Deutsch Lebenslauf'
];
// List of language image flags
final List<String> imagesOfLanguages = <String>[
  'flag_for_united_kingdom_1f1ec_1f1e7.png',
  'flag_for_germany_1f1e9_1f1ea.png'
];
// Filenames for the resume JSON files
const String englishResumeFile = 'englishResume.json';
const String germanResumeFile = 'deutschResume.json';
// URLs for the resume JSON files located in GitHub
const String ENGLISH_RESUME_URL =
    'https://raw.githubusercontent.com/akarsh/akarsh.github.io/master/json/en/resume.json';
const String GERMAN_RESUME_URL =
    'https://raw.githubusercontent.com/akarsh/akarsh.github.io/master/json/de/resume.json';

class MyApp extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    storeFile();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akarsh Seggemu'),
      ),
      body: ListView.builder(
        itemCount: resumeNames.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
                leading: Image.asset(
                  'images/${imagesOfLanguages[index]}',
                  width: 40,
                  height: 40,
                ),
                title: Text('${resumeNames[index]}'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ResumeLayout(documentHelper: DocumentHelper(),),
                      ));
                }),
          );
        },
      ),
    );
  }
}

void storeFile() async {
  final fileName = await DocumentHelper().localFile;
  DownloadHelper().downloadFile(fileName, ENGLISH_RESUME_URL);
}
