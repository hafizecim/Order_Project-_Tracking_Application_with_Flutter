import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
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
               renk("240b36").withOpacity(0.8),// Başlangıç rengi // %70 opak, daha açık görünür
               renk("c31432").withOpacity(0.8) // Bitiş rengi
              ],
            ),
          ),
          child: Column(   // 🔹 Burada "child:" kullanıyoruz
            children: [
              Container(
                height: 120,
                
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 30, left: 10, right: 10), 
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Son Projeler", style: GoogleFonts.quicksand(fontWeight: FontWeight.w800, fontSize: 20, color:renk("240b36"),),),
                          Text("Tüm Projeler", style: GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 17, color:renk("c31432"),),),
                        ],

                      ),
                      FutureBuilder( future:veriGetir.projeleri_getir(context),
                        builder: (context, snapshot){
                        if(snapshot.hasData){
                          print(snapshot.data); // gelen verileri görmek için
                          return Text("Tamamlandı");
                        }else{
                          return CircularProgressIndicator(); // dönen bir yuvarlak oluşturma
                        }

                      },),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
