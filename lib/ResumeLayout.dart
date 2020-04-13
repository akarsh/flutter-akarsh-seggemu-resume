/*
 * Copyright © 2020 Akarsh Seggemu. All rights reserved.
 */

import 'dart:async';

import 'package:akarsh_seggemu_resume/ResumeJSONSchema.dart';
import 'package:flutter/material.dart';
import './ContactLayout.dart';
import './DocumentHelper.dart';

// List of schema images
final List<String> imageOfSchemas = <String>[
  'card_index_1f4c7.png',
  'information_source_2139.png',
  'speech_balloon_1f4ac.png',
  'bust_in_silhouette_1f464.png',
  'hammer_and_wrench_1f6e0.png',
  'globe_with_meridians_1f310.png',
  'graduation_cap_1f393.png',
  'hourglass_with_flowing_sand_23f3.png',
  'rosette_1f3f5.png',
  'trophy_1f3c6.png',
  'books_1f4da.png',
  'black_heart_suit_2665.png',
  'memo_1f4dd.png'
];

// List of schema names
final List<String> namesOfSchemas = <String>[
  'contact',
  'info',
  'summary',
  'profiles',
  'skills',
  'languages',
  'education',
  'experience',
  'volunteer',
  'awards',
  'publications',
  'interests',
  'references'
];

//Second Screen
class ResumeLayout extends StatefulWidget {
  final DocumentHelper documentHelper;

  ResumeLayout({Key key, @required this.documentHelper}) : super(key: key);

  @override
  ResumeScreenState createState() => ResumeScreenState();
}

class ResumeScreenState extends State<ResumeLayout> {
  ResumeJsonSchema resumeJsonSchema;
  @override
  void initState() {
    super.initState();
    widget.documentHelper.readData().then((String value) {
      setState(() {
        resumeJsonSchema = resumeJsonSchemaFromJson(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: ListView.builder(
        itemCount: imageOfSchemas.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
                leading: Image.asset(
                  'images/${imageOfSchemas[index]}',
                  width: 40,
                  height: 40,
                ),
                title: Text('${namesOfSchemas[index]}'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ContactLayout(
                          basics: resumeJsonSchema.basics,
                        ),
                      ));
                }),
          );
        },
      ),
    );
  }
}
