import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_project_tracking_application/sabitler/ext.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({super.key});

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: renk(arka_renk)),
          child: Column(
            children: [
              Container(
                width: 180,
                height: 180,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: renk("202F3A"), width: 15),
                  ),
                  child: Icon(Icons.login, size: 45),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Giriş Yapın",
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: renk("333443"),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 5,
                  bottom: 5,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Kullanıcı Adı",
                    hintStyle: GoogleFonts.quicksand(color: renk("5ba7fb")),
                    prefix: Icon( Icons.people_alt_outlined, color: renk("5ba7fb")), // solda
                    // suffix: Icon(Icons.check_circle_outline, color: renk(metin_renk)), // sağda 
                  ),
                  style: GoogleFonts.quicksand(color: renk(metin_renk)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
