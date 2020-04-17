/*
 * Copyright © 2020 Akarsh Seggemu. All rights reserved.
 */
import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:akarsh_seggemu_resume/ResumeJSONSchema.dart';

class DocumentHelper {
// The path to the documents directory
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Store the file, create a reference to the file’s full location
  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/resume.json');
  }

  Future<String> readData() async {
    try {
      final localFileName = await localFile;
      String fileContents = await localFileName.readAsString();
      return fileContents;
    } catch (e) {
      return e.toString();
    }
  }
}
