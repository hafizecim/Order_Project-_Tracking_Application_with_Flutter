import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_project_tracking_application/model/proje_model.dart';
import 'package:order_project_tracking_application/sabitler/ext.dart';
import 'package:order_project_tracking_application/servis/veri_getir.dart';

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Son Projeler",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: renk("240b36"),
                            ),
                          ),
                          Text(
                            "Tüm Projeler",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: renk("c31432"),
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
                                return Expanded(
                                  child: ListView.builder(
                                    itemCount: projeler
                                        .length, // projelerin uzunğu kadar çalıştır
                                    itemBuilder: (context, index) {
                                      ProjeModel proje = projeler[index];
                                      // return Text(proje.projeBaslik!);
                                      return Container(
                                        padding: EdgeInsets.all(15),
                                        margin: EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: renk('240b36'),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Center(
                                                child: Text(
                                                  proje.yuzde.toString(),
                                                  style: GoogleFonts.bebasNeue(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                  ),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: renk(arka_renk),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              padding: EdgeInsets.only(
                                                right: 10,
                                                left: 10,
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  proje.projeBaslik!,
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(proje.projeAciliyet!),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                          ),
                                                      width: 5,
                                                      height: 4,
                                                      decoration: BoxDecoration(
                                                        color: renk("c31432"),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              100,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      proje.projeTeslimTarihi!,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.chevron_right,
                                                    color: renk("240b36"),
                                                    size: 40,
                                                  ),
                                                ),
                                                alignment: Alignment.centerRight,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
