/*
 * Copyright © 2020 Akarsh Seggemu. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:akarsh_seggemu_resume/ResumeJSONSchema.dart';
import 'package:akarsh_seggemu_resume/DocumentHelper.dart';
import 'package:akarsh_seggemu_resume/DownloadHelper.dart';

class ContactLayout extends StatefulWidget {
  final Basics basics;
  ContactLayout({Key key, @required this.basics}) : super(key: key);

  @override
  _ContactLayoutScreenState createState() => _ContactLayoutScreenState();
}

class _ContactLayoutScreenState extends State<ContactLayout> {
  String imageFileName;
  void storeImageFile() async {
    final localPath = await DocumentHelper().localPath;
    final fileName = new File('$localPath/standard_profile.jpg');
    DownloadHelper().downloadFile(fileName, widget.basics.picture);
  }

  Future<String> get getImageFile async {
    try {
      final localPath = await DocumentHelper().localPath;
      return '$localPath/standard_profile.jpg';
    } catch (e) {
      return e.toString();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeImageFile();
    getImageFile.then((String value) {
      setState(() {
        imageFileName = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
                      child: Text(
                        '${widget.basics.name ?? "Name"}',
                      ),
                    ),
                    Container(
                      width: 220,
                      padding: const EdgeInsets.fromLTRB(2, 15, 10, 10),
                      child: Text('${widget.basics.label ?? "label"}'),
                    )
                  ],
                ),
                Container(
                  height: 100,
                  child: Image.file(
                    File(imageFileName),
                    width: 80,
                    height: 80,
                  ),
                ),
              ],
            ),
            Container(
                height: 30,
                padding: const EdgeInsets.fromLTRB(2, 0, 120, 0),
                child: Text('${widget.basics.email ?? "Email"}')),
            Container(
                height: 30,
                padding: const EdgeInsets.fromLTRB(2, 0, 190, 0),
                child: Text('${widget.basics.phone ?? "Phone"}')),
            Container(
                height: 30,
                padding: const EdgeInsets.fromLTRB(2, 0, 170, 0),
                child: Text('${widget.basics.website ?? "Website"}')),
            Container(
                height: 35,
                padding: const EdgeInsets.fromLTRB(10, 0, 150, 0),
                child: Text('${widget.basics.location.address ?? "Address"}')),
            Container(
              height: 20,
              padding: const EdgeInsets.fromLTRB(0, 2, 205, 0),
              child: Text(
                  '${widget.basics.location.postalCode ?? "Postal Code"}, ${widget.basics.location.city ?? "City"}'),
            ),
            Container(
              height: 20,
              padding: const EdgeInsets.fromLTRB(0, 2, 205, 0),
              child: Text(
                  '${widget.basics.location.region ?? "Region"}, ${widget.basics.location.countryCode ?? "Country code"}'),
            ),
          ],
        ),
      ),
    );
  }
}
