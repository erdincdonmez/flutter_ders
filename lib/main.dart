import 'package:flutter/material.dart';
import 'package:flutter_ders/models/ogrenci.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String uygulamaAdi = "Öğrenci Takip Sistemi";
  int not = 60;
  @override
  Widget build(BuildContext context) {
    var ogrenciler = ["Erdinç","Erhan","Ensar"];
    //var ogrenciler1 = new List<Ogrenci>();
    List <Ogrenci> ogrenciler1 = [
      Ogrenci("Erdinç", "Dönmez", 438,100,"https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166__340.jpg"),
      Ogrenci("Erhan", "Yıldız", 338,50,"https://cdn.pixabay.com/photo/2016/11/18/19/07/happy-1836445__340.jpg"),
      Ogrenci("Esma", "Zinde", 238,40,""),];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(uygulamaAdi),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount:ogrenciler1.length,
                itemBuilder:(BuildContext context, int index){
//                  return Text(ogrenciler1[index].numarasi.toString());
                  //return Text(ogrenciler1[index].soyAdi);
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(ogrenciler1[index].resmi),
                    ),
                    title: Text(ogrenciler1[index].adi+" "+ogrenciler1[index].soyAdi),
                    subtitle: Text("Öğrenci puanı: "+ogrenciler1[index].puani.toString()),
                    //trailing: Icon(Icons.done),
                    trailing: buildDurumIconu(ogrenciler1[index].puani),
                    onTap: (){
                      var mesaj = ogrenciler1[index].adi +" "+ ogrenciler1[index].soyAdi+" notu : "+ogrenciler1[index].puani.toString();
                      mesajGoster(context, mesaj);
                      print(ogrenciler1[index].adi +" "+ ogrenciler1[index].soyAdi+" notu : "+ogrenciler1[index].puani.toString());
                    },
                  );
                }
            ),
          ),
          Center(
            //child: Text("Gövde kısmı"),
            child: RaisedButton(
              child: Text("Sonucu gör"),
              onPressed: () {

                var mesaj = sinavHesapla(not);
                mesajGoster(context, mesaj);

              },
            ),
          ),
        ],
      ),
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

  buildDurumIconu(int puani) {
    if (puani >= 50) return Icon(Icons.done);
        else if (puani<50) return Icon(Icons.square);
        else return Icon(Icons.clear);
  }

}
