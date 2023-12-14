import 'package:flutter/material.dart';
import 'package:flutter_burc/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.black12;
  //2.late= ben seni kullanmadan önce initialized(başlatıcam) edicem bekle
  late PaletteGenerator _generator;

  @override
  void initState() {
    //1.değişkenlerimizin ilk atamasını yaparken kullanırız
    super.initState();
    appbarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //yüksekliği
            expandedHeight: 250,
            //başta sabit kalsın mı
            pinned: true,
            floating: true,
            snap: true,
            backgroundColor: appBarRengi,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title:
                    Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
                background: Image.asset(
                  "images/" + widget.secilenBurc.burcBuyukResim,
                  fit: BoxFit.cover,
                )),
          ),
          //hala bizden sliver türünde bir şeyler istiyor bu yüzden column gibi widgetlar kullanabilmek için sliverboxadapter kkoyup childına istediğini koyabilirsin
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetayi,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void appbarRenginiBul() async {
    //TODO bu bir future future fonksiyonuna almadan kullanamazsın
    //3.initialized ediyoruz
    //4.stateden widgeta erişmek için widget. kullanılır
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("images/${widget.secilenBurc.burcBuyukResim}"));
    appBarRengi = _generator.dominantColor!.color;
    print(appBarRengi);
    setState(() {});
  }
}
