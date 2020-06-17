import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Absen extends StatefulWidget {
  @override
  _AbsenState createState() => _AbsenState();
}

class _AbsenState extends State<Absen> {
  String _address;
  bool _loading = true;
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> location = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark placeMark  = location[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String country = placeMark.country;
    String address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";

    setState(() {
      _address = address;
      _loading = false;
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absen'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null ? Text('Belum ada foto.') : Container(width: 200.0, child: Image.file(_image),),
                  SizedBox(
                    height: 20.0,
                  ),
                  _loading ? Text("Menunggu alamat!") : Text(_address, textAlign: TextAlign.center,),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    child: Text("Ambil Foto"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: (){
                      getImage();
                    },
                  ),
                ]
            ),
          ],
        )
      ),
    );
  }
}
