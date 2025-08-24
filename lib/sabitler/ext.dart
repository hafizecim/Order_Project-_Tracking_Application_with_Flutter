import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String arka_renk = "3E4050";
const String metin_renk = "7F8C99";
const String api_key = "h1a2f3i4z9e8s7e6n5y4i3l";
const String site_link = "http://192.168.0.17/script/order_project_tracking_web/"; //127.0.0.1
const String api_link =
    "http://192.168.0.17/script/order_project_tracking_web/islemler/islem.php"; //127.0.0.1

class renk extends Color {
  static int _donustur(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }

    return int.parse(hexColor, radix: 16);
  }

  renk(final String renk_kodu) : super(_donustur(renk_kodu));
}

alt_mesaj(BuildContext context, String mesaj,{int tur = 0}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        mesaj, //
        style: GoogleFonts.quicksand(fontSize: 15),
        textAlign: TextAlign.center,
      ),
      backgroundColor: tur==0? renk("c31432"): renk("15400e"),
      //duration: Duration(milliseconds: 100),
      behavior:
          SnackBarBehavior.floating, // yukarı kaldırır, radius daha net görünür
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // köşeleri yuvarlatır
      ),
      margin: EdgeInsets.all(15),
    ),
  ); // ekran kenarından boşluk),);
}
