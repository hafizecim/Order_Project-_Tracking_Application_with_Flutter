import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_project_tracking_application/model/proje_model.dart';
import 'package:order_project_tracking_application/sabitler/ext.dart';

Widget projeBox(ProjeModel proje) {
  bool bittimi = proje.projeDurum =="Bitti"? true : false;
  Color metin_renk = bittimi? Colors.white: Colors.black;
  return InkWell(
    onTap: () {
      print(proje.projeBaslik! + ": Tıklandı");
    },
    child: Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: renk(lacivert), width: 1),
        borderRadius: BorderRadius.circular(20),
        //color: proje.yuzde == 100 ? renk("7F8C99"): Colors.transparent,
        //color: proje.projeDurum== "Bitti" ? renk("0d730d"): Colors.transparent,
        color: bittimi ? renk("0d730d"): Colors.transparent,
        /*
        color: proje.yuzde == 100 
        ? renk("7F8C99")          // %100 tamamlandı -> gri
        : (proje.yuzde! >= 50
        ? renk("ebe939")      // %50–99 -> sarı
        : renk("ea0000")),        // %0–49 -> kırmızı
        */
      ),
      child: Row(
        children: [
          Container(
            child: Center(
              child: Text(
                proje.yuzde.toString(),
                style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 30),
              ),
            ),
            decoration: BoxDecoration(
              color: renk(bordo),
              borderRadius: BorderRadius.circular(100),
            ),
            padding: EdgeInsets.only(right: 10, left: 10),
            width: 50,
            height: 50,
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                proje.projeBaslik!,
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w800,
                  fontSize: 20, color:metin_renk
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(proje.projeAciliyet!, style: GoogleFonts.quicksand(color: metin_renk)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 5,
                    height: 4,
                    decoration: BoxDecoration(
                      color: renk(bordo),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Text(proje.projeTeslimTarihi!, style: GoogleFonts.quicksand(color: metin_renk),),
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
                  color: renk(lacivert),
                  size: 40,
                ),
              ),
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
    ),
  );
}
