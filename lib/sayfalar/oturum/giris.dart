import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_project_tracking_application/sabitler/ext.dart';
import 'package:order_project_tracking_application/sabitler/tema.dart';
import 'package:order_project_tracking_application/servis/oturum.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({super.key});

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  Tema tema = Tema();

  Oturum oturum = Oturum();
  String mail = "";
  String sifre = "";

  bool sifre_gozukme = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: renk(arka_renk)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 180,
                  height: 180,
                  margin: EdgeInsets.only(top: 50),
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
                    child: Icon(
                      Icons.person,
                      size: 110,
                      color: const Color.fromARGB(255, 128, 24, 17),
                    ),
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
                  decoration: tema.inputBoxDec(),
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                    right: 30,
                    left: 30,
                  ),
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 5,
                    bottom: 5,
                  ),
                  child: TextFormField(

                    onChanged: (value) => mail=value,

                    decoration: tema.InputDec(
                      "Kullanıcı Adı veya E-posta adresinizi girin",
                      Icons.people_alt_outlined,
                    ),
                    style: GoogleFonts.quicksand(color: renk(metin_renk)),
                  ),
                ),
                Container(
                  decoration: tema.inputBoxDec(),
                  margin: EdgeInsets.only(
                    top: 5,
                    bottom: 30,
                    right: 30,
                    left: 30,
                  ),
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          
                          onChanged: (value) => sifre=value,

                          obscureText:
                              sifre_gozukme, // Şifre alanı için gizleme
                          decoration: tema.InputDec(
                            "Şifrenizi girin",
                            Icons.vpn_key_outlined,
                            //letterSpacing: 5,
                          ),
                          style: GoogleFonts.quicksand(
                            color: renk(metin_renk),
                            // letterSpacing: 5,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            sifre_gozukme =
                                !sifre_gozukme; // eğer true ise false false ise tru yapacak
                          });
                        },
                        icon: Icon(
                          sifre_gozukme
                              ? Icons.password_outlined
                              : Icons
                                    .remove_red_eye, // şifre gözüküyorsa göz iconu , gözükmüyorsa şirfe gizle iconu göster
                          color: renk("7F8C99"),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Giriş yapma işlemi burada gerçekleştirilecek
                    // Örneğin, kullanıcı adı ve şifre doğrulaması yapılabilir
                    // print("Giriş yapılıyor...");
                    if (mail.length < 3 || !mail.contains("@")) {
                      alt_mesaj(context, "Lütfen doğru E-mail adresi giriniz.");
                    } /* else if (mail.contains("@")) { // mail adresinde @ işaret varmı yokmu
                      alt_mesaj(context, "Lütfen doğru E-mail adresi giriniz.");
                    }*/
                    else if (sifre.length < 2) {
                      alt_mesaj(context, "Şifre uzunluğu 2 karekterden fazla olmalıdır.");
                    } else {
                      oturum.oturum_ac(context, mail, sifre);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.5,

                    //margin: EdgeInsets.symmetric(horizontal: 50),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [renk("240b36"), renk("c31432")],
                        begin: Alignment
                            .topRight, // başlangıç noktası gradyanın ilk rengi
                        end: Alignment
                            .bottomLeft, // bitiş noktası gradyanın ikinci rengi
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: renk("c31432").withOpacity(0.5),
                          offset: Offset(0, 4), // gölge ofseti
                          blurRadius: 10, // bulanıklık yarıçapı
                          spreadRadius: 2, // yayılma yarıçapı
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Giriş Yap",
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
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
