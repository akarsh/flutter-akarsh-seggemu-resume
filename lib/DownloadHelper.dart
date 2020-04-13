/*
 * Copyright © 2020 Akarsh Seggemu. All rights reserved.
 */

import 'dart:io';

class DownloadHelper {
  void downloadFile(File fileName, String fileURL) {
    HttpClient client = new HttpClient();
    client.getUrl(Uri.parse('$fileURL'))
        .then((HttpClientRequest request) {
      return request.close();
    })
        .then((HttpClientResponse response) {
      response.pipe(fileName.openWrite());
    });
  }
}
