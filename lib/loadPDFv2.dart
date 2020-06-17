import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

class LoadPDFv2 extends StatefulWidget {
  @override
  _LoadPDFv2State createState() => new _LoadPDFv2State();
}

class _LoadPDFv2State extends State<LoadPDFv2> {
  String pathPDF = "";

  /*
  @override
  void initState() {
    super.initState();
    createFileOfPdfUrl().then((f) {
      setState(() {
        pathPDF = f.path;
        print(pathPDF);
      });
    });
  }
  */

  Future<File> createFileOfPdfUrl() async {
    final url = "https://ojk.go.id/id/berita-dan-kegiatan/siaran-pers/Documents/Pages/Siaran-Pers-Kemenkeu-dan-OJK-Tandatangani-SKB-Pelaksanaan-Penempatan-Dana-dan-Pemberian-Subsidi-Bunga/SPB%20-%20Kemenkeu%20dan%20OJK%20Tandatangani%20SKB%20Pelaksanaan%20Penempatan%20Dana%20dan%20Pemberian%20Subsidi.pdf";
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: createFileOfPdfUrl(), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {  // AsyncSnapshot<Your object type>
        if( snapshot.connectionState == ConnectionState.waiting){
          return Scaffold(
            appBar: AppBar(title: Text('Load PDF(URL) v2')),
            body: Text("Mohon tunggu"),
          );
        }else{
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else
            return Scaffold(
              body: PDFViewerScaffold(
                  appBar: AppBar(
                    title: Text("Document"),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  path: '${snapshot.data.path}'),
            );
        }
      },
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Load PDF(URL) v2')),
      body: PDFViewerScaffold(
          appBar: AppBar(
            title: Text("Document"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
          path: pathPDF),
    );
  }
}