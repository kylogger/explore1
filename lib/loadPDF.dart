import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';


class PDFStorage extends StatefulWidget {
  @override
  _PDFStorageState createState() => _PDFStorageState();
}

class _PDFStorageState extends State<PDFStorage> {

  String samplePDF = 'pdf/sample.pdf';
  PDFDocument _doc;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initPDF();
  }

  _initPDF() async{

    final doc = await PDFDocument.fromAsset(samplePDF);
    setState(() {
      _doc = doc;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load From Storage'),
      ),
      body: Center(
        child:  _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(document: _doc)
      ),
    );
  }
}

class PDFUrl extends StatefulWidget {
  @override
  _PDFUrlState createState() => _PDFUrlState();
}

class _PDFUrlState extends State<PDFUrl> {
  String samplePDF = 'https://ojk.go.id/id/berita-dan-kegiatan/siaran-pers/Documents/Pages/Siaran-Pers-Kemenkeu-dan-OJK-Tandatangani-SKB-Pelaksanaan-Penempatan-Dana-dan-Pemberian-Subsidi-Bunga/SPB%20-%20Kemenkeu%20dan%20OJK%20Tandatangani%20SKB%20Pelaksanaan%20Penempatan%20Dana%20dan%20Pemberian%20Subsidi.pdf';
  PDFDocument _doc;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initPDF();
  }

  _initPDF() async{

    final doc = await PDFDocument.fromURL(samplePDF);
    setState(() {
      _doc = doc;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load From URL'),
      ),
      body: Center(
          child:  _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: _doc)
      ),
    );
  }
}



