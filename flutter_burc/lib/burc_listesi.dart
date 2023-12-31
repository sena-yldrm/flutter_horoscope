import 'package:flutter/material.dart';
import 'package:flutter_burc/burc_item.dart';
import 'package:flutter_burc/data/strings.dart';
import 'package:flutter_burc/model/burc.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
    print(veriKaynaginiHazirla());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burc Listesi"),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            
            return BurcItem(listelenenBurc: tumBurclar[index]);
          },
          itemCount: tumBurclar.length,
          
        ),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      //koc1.png degerini oluşturma Koc===>koc===>koc1.png
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";
      //nesnemizi hazırladık
      Burc eklencekBurc =
          Burc(burcAdi, burcTarih, burcDetay, burcKucukResim, burcBuyukResim);
      //listeye ekledik
      gecici.add(eklencekBurc);
    }

    return gecici;
  }
}
