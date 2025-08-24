import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:order_project_tracking_application/model/kullanici.dart';
import 'package:order_project_tracking_application/sabitler/ext.dart';
import 'package:get_storage/get_storage.dart';

class Oturum {

GetStorage box = GetStorage();

 Future<bool> oturum_ac(BuildContext context, String mail, String sifre) async {
    print(api_link + "?api_key=" + api_key);
    http.Response sonuc = await http.post(
      Uri.parse(api_link + "?api_key=" + api_key),
      body: {'oturumac': 'true', 'kul_mail': mail, 'kul_sifre': sifre},
    );

    print(sonuc.statusCode);
    print("Response Body: ${sonuc.body}");

    if (sonuc.statusCode == 200) {//200 bağlantı işlemi başarılı ise
      // print(sonuc.body); // terminal kontrol için
      Map <String , dynamic> gelen = jsonDecode(sonuc.body);
      Kullanici kullanici = Kullanici.fromJson(gelen['bilgiler']); 
      print(kullanici.kulIsim);
      print(gelen);
        if(gelen['durum']=="ok"){
            alt_mesaj(context, "Oturum açma işlemi Başarılı", tur:1);

            await box.write("kul",gelen['bilgiler']);




            return true;
        }else{
            alt_mesaj(context, gelen['mesaj']); // site üzerinden gelen mesaj gösterilecek
            return false;
        }

    } else {
        alt_mesaj(context, "İşleminize Şu anda gerçekleştirmiyoruz. Lütfen daha sonr tekrar deneyin");
      //return [false,"İşleminize Şu anda gerçekleştirmiyoruz. Lütfen daha sonr tekrar deneyin",];
      return false;
    }
  }
}
