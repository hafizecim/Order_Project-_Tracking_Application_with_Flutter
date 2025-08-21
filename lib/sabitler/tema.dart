import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ext.dart';

class Tema {
  InputDec(String hintText, IconData icon) {
    return InputDecoration(
      border: InputBorder.none,
      hintText: hintText, //"Kullanıcı Adı veya E-posta adresinizi girin",
      hintStyle: GoogleFonts.quicksand(color: renk(metin_renk)),
      prefix: Icon(icon, color: renk("5ba7fb")), // solda
      // suffix: Icon(Icons.check_circle_outline, color: renk(metin_renk)), // sağda
    );
  }


  inputBoxDec(){
    return BoxDecoration(
                  color: renk("333443"),
                  borderRadius: BorderRadius.circular(20),
    );
  }
}
