import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_project_tracking_application/model/proje_model.dart';
import 'package:order_project_tracking_application/sabitler/ext.dart';

Widget projeBox(ProjeModel proje) {
  return InkWell(
    onTap: () {
      print(proje.projeBaslik! + ": Tıklandı");
    },
    child: Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: renk('240b36'), width: 1),
        borderRadius: BorderRadius.circular(20),
        //color: proje.yuzde == 100 ? renk("7F8C99"): Colors.transparent,
        color: proje.projeDurum== "Bitti" ? renk("0d730d"): Colors.transparent,
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
                  fontSize: 20,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(proje.projeAciliyet!),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 5,
                    height: 4,
                    decoration: BoxDecoration(
                      color: renk("c31432"),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Text(proje.projeTeslimTarihi!),
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
    ),
  );
}
