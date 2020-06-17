import 'package:explore1/absen.dart';
import 'package:explore1/loadPDF.dart';
import 'package:explore1/loadPDFv2.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("Absen"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Absen()));
            },
          ),
          RaisedButton(
            child: Text("Load PDF(Storage)"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PDFStorage()));
            },
          ),
          RaisedButton(
            child: Text("Load PDF(URL)"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PDFUrl()));
            },
          ),
          RaisedButton(
            child: Text("Load PDF(URL) v2"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoadPDFv2()));
            },
          ),
        ],
      ),
    );
  }
}
