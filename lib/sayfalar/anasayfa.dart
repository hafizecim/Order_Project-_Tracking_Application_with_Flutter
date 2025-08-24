import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_project_tracking_application/model/proje_model.dart';
import 'package:order_project_tracking_application/model/siparis_model.dart';
import 'package:order_project_tracking_application/sabitler/ext.dart';
import 'package:order_project_tracking_application/servis/veri_getir.dart';
import 'package:order_project_tracking_application/widget/projeBox.dart';
import 'package:order_project_tracking_application/widget/siparisBox.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  VeriGetir veriGetir = VeriGetir();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: renk(arka_renk),
        body: Container(
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
            // 🔹 Burada "child:" kullanıyoruz
            children: [
              Container(height: 120),
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
                            child: Column(
                              children: [
                                // Proje alanı
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Son Projeler",
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                        color: renk("240b36"),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Tüm Projeler",
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          color: renk("c31432"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                FutureBuilder(
                                  future: veriGetir.projeleri_getir(context),
                                  builder: (context, AsyncSnapshot<List> snapshot) {
                                    if (snapshot.hasData) {
                                      //print(snapshot.data); // gelen verileri görmek için
                                      List? sonuc = snapshot.data;
                                      if (sonuc!.first) {
                                        //sonuc.[0]
                                        List projeler = sonuc.last;
                                        if ((projeler as List).length == 0) {
                                          return Text("Proje Bulunamadı");
                                        } else {
                                          //return Text("Tamamlandı");
                            
                                          List<Widget> ogeler=[];
                                           for(var i = 0; i <= projeler.length-1;i++){
                                            ProjeModel proje = projeler[i];
                                            ogeler.add(projeBox(proje));
                            
                                           }
                            
                                          return Column(
                                            children: ogeler,
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
                              
                                SizedBox(height: 40,),
                                // Sipariş alanı
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Son Siparişler",
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20,
                                        color: renk("240b36"),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Tüm Siparişler",
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          color: renk("c31432"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                FutureBuilder(
                                  future: veriGetir.siparisleri_getir(context),
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
                            
                                          List<Widget> ogeler=[];
                                           for(var i = 0; i <= siparisler.length-1;i++){
                                            SiparisModel siparis = siparisler[i];
                                            ogeler.add(siparisBox(siparis));
                            
                                           }
                            
                                          return Column(
                                            children: ogeler,
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
                              ],
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
