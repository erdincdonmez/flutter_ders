import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  // değişken tanımlarını calss ın başına yap.
  String uygulamaAdi = "erdincdonmez";
  int not = 60;
  var ogrenciler = ["Erdinç","Erhan","Ensar","Esma"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(uygulamaAdi),
        ),
        body: buildBody(context)
    );
    //throw UnimplementedError();
  }
  String sinavHesapla(not){
    String durum = "e";
    if (not >= 50)
      durum = "Geçti";
    else
      durum = "Kaldı";
    return durum;
  }
  void mesajGoster(BuildContext context, String mesaj){
    var alert = AlertDialog(
      title: Text("Sınav sonucu"),
      content: Text(mesaj),
    );
    showDialog(
        context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount:ogrenciler.length,
              itemBuilder:(BuildContext context, int index){
                return Text(ogrenciler[index]);
              }
          ),
        ),
        Center(
          //child: Text("Gövde kısmı"),
          child: RaisedButton(
            child: Text("Sonucu gör!"),
            onPressed: () {

              var mesaj = sinavHesapla(not);
              mesajGoster(context, mesaj);

            },
          ),
        ),
      ],
    );
  }
}
