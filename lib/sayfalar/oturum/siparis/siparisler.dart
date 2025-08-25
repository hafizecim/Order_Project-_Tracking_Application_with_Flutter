import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_project_tracking_application/model/siparis_model.dart';
import 'package:order_project_tracking_application/sabitler/ext.dart';
import 'package:order_project_tracking_application/servis/veri_getir.dart';
import 'package:order_project_tracking_application/widget/siparisBox.dart';

class SiparislerSayfasi extends StatefulWidget {
  const SiparislerSayfasi({super.key});

  @override
  State<SiparislerSayfasi> createState() => _SiparislerSayfasiState();
}

class _SiparislerSayfasiState extends State<SiparislerSayfasi> {
  VeriGetir veriGetir = VeriGetir();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar:
            true, // 🔹 AppBar'ın arkasını da body'ye dahil eder
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white, // geri butonunun rengi
          ),

          title: Text(
            "Tüm siparisler",
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        //backgroundColor: renk(arka_renk),
        body: Container(
          padding: const EdgeInsets.only(top: 35.0), // AppBar altında boşluk
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft, // Gradyanın başladığı nokta
              end: Alignment.bottomRight, // Gradyanın bittiği nokta
              colors: [
                renk("240b36").withOpacity(
                  0.8,
                ), // Başlangıç rengi // %70 opak, daha açık görünür
                renk("c31432").withOpacity(0.8), // Bitiş rengi
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 120,
                child: FutureBuilder(
                  future: veriGetir.siparisleri_getir(limit: "2"),
                  builder:
                      (
                        BuildContext context,
                        AsyncSnapshot<List<dynamic>> snapshot,
                      ) {
                        if (snapshot.hasData) {
                          List? sonuc = snapshot.data;
                          if (sonuc!.first) {
                            List siparisler = sonuc.last;
                            if (siparisler.length == 0) {
                              return Text("SİPARİŞLER BULUNAMADI");
                            } else {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: siparisler.length,
                                itemBuilder: (context, index) {
                                  SiparisModel siparis = siparisler[index];
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width - 30,
                                    decoration: BoxDecoration(
                                      color: renk(bordo),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.only(
                                      right: 15,
                                      left: 15,
                                      bottom: 15,
                                      top: 15,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              siparis.sipTeslimTarihi!,
                                              style: GoogleFonts.quicksand(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              siparis.sipBaslik!,
                                              style: GoogleFonts.quicksand(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: renk(lacivert),
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.white,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              siparis.yuzde.toString() + "%",
                                              style: GoogleFonts.bebasNeue(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                          width: 60,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          } else {
                            return Text("Hata");
                          }
                        } else {
                          return CircularProgressIndicator(); // dönen bir yuvarlak oluşturma
                        }
                      },
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: FutureBuilder(
                              future: veriGetir.siparisleri_getir(
                                limit: "1,99999999",
                              ), // context sildim
                              builder: (context, AsyncSnapshot<List> snapshot) {
                                if (snapshot.hasData) {
                                  //print(snapshot.data); // gelen verileri görmek için
                                  List? sonuc = snapshot.data;
                                  if (sonuc!.first) {
                                    //sonuc.[0]
                                    List siparisler = sonuc.last;
                                    if ((siparisler as List).length == 0) {
                                      return Text("Sipariş Bulunamadı");
                                    } else {
                                      //return Text("Tamamlandı");

                                      List<Widget> ogeler = [];
                                      for (
                                        var i = 0;
                                        i <= siparisler.length - 1;
                                        i++
                                      ) {
                                        SiparisModel siparis = siparisler[i];
                                        ogeler.add(siparisBox(siparis));
                                      }

                                      return Column(children: ogeler);
                                    }
                                  } else {
                                    return Text("Hata");
                                  }
                                } else {
                                  return CircularProgressIndicator(); // dönen bir yuvarlak oluşturma
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
