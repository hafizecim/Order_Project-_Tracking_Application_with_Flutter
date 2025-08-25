import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_project_tracking_application/model/proje_model.dart';
import 'package:order_project_tracking_application/sabitler/ext.dart';
import 'package:order_project_tracking_application/widget/bilgiSatir.dart';

class ProjeDetay extends StatefulWidget {
  final ProjeModel proje;
  ProjeDetay(this.proje);

  @override
  State<ProjeDetay> createState() => _ProjeDetayState();
}

class _ProjeDetayState extends State<ProjeDetay> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: renk(arka_renk),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Proje Detayı",
            style: GoogleFonts.quicksand(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: renk(kirmizi),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: renk("F64250"),
                        offset: Offset(0, 7),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // uzun metinler için
                      AutoSizeText(
                        widget.proje.projeBaslik!,
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      SizedBox(width: 10),
                      bilgiSatir(
                        "Başlangıç Tarihi",
                        widget.proje.projeTeslimTarihi!,
                      ),
                      bilgiSatir(
                        "Bitiş Tarihi",
                        widget.proje.projeTeslimTarihi!,
                      ),
                      bilgiSatir("Aciliyet", widget.proje.projeAciliyet!),
                      bilgiSatir("Durum", widget.proje.projeDurum!),
                      bilgiSatir("Yüzde", widget.proje.yuzde.toString() + "%"),

                      widget.proje.dosyaYolu!.isNotEmpty
                          ? InkWell(
                              onTap: () {
                                print("Dosya indi");
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text("Dosyayı indir"),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white54,
                        offset: Offset(0, 7),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Html(
                    data: widget.proje.projeDetay!,
                    onLinkTap: (url, attributes, element) {
                      print("Link:" + url!);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
