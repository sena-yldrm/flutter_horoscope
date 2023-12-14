import 'package:flutter/material.dart';
import 'package:flutter_burc/burc_detay.dart';
import 'package:flutter_burc/model/burc.dart';

//yapman gerekenler final olarak burctan nesne üretip zorunlu olarak geç
//card olustur
class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 5,
        shadowColor: Colors.pink.shade900,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  //listelenen burc aslında seçilen burctur
                  builder: (context) => BurcDetay(secilenBurc: listelenenBurc),
                ),
              );
            },
            leading: Image.asset(
              "images/" + listelenenBurc.burcKucukResim,
            ),
            title: Text(
              "${listelenenBurc.burcAdi}",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              "${listelenenBurc.burcTarihi}",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.pinkAccent,
            ),
          ),
        ),
      ),
    );
  }
}
