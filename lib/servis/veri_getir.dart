import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
// import 'package:order_project_tracking_application/model/kullanici.dart';
import 'package:order_project_tracking_application/model/proje_model.dart';
import 'package:order_project_tracking_application/model/siparis_model.dart';
import 'package:order_project_tracking_application/sabitler/ext.dart';

class VeriGetir {
  GetStorage box = GetStorage();

  Future<Map> istek(int tur, {String order = "", String limit = ""}) async {
    Map param = {};

    if (tur == 0) {
      param = {'projeleri_getir': 'true'};
    } else if (tur == 1) {
      param = {'siparisleri_getir': 'true'};
    }

    if (limit.isNotEmpty) {
      param['limit'] = limit;
    }

    if (order.isNotEmpty) {
      param['sirala'] = order;
    }

    print(api_link + "?api_key=" + api_key);
    http.Response sonuc = await http.post(
      Uri.parse(api_link + "?api_key=" + api_key),
      body: param,
    );
    print(sonuc.statusCode);
    print("Response Body: ${sonuc.body}");

    if (sonuc.statusCode == 200) {
      //200 bağlantı işlemi başarılı ise
      // print(sonuc.body); // terminal kontrol için
      Map<String, dynamic> gelen = jsonDecode(sonuc.body);
      return gelen;
    } else {
      return {'durum': 'no', 'mesaj': 'Bağlantı işlemi başarısız'};
    }
  }

  Future<List> projeleri_getir({String order = "proje_id DESC", String limit = "3"}) async {
    // Buiild context sildim
    
/* {bool son_projeler = true}
    String limit = "";
    String order = "";
    if (son_projeler) {
      limit = "3";
      order = "proje_id DESC";
    }
*/
    Map veri = await istek(
      0,
      limit: limit,
      order: order,
    ); // Son eklenen başa gelecek şekilde sırala limit 3
    List<ProjeModel> projeler = [];
    if (veri['durum'] == 'ok') {
      for (var element in veri['projeler']) {
        projeler.add(ProjeModel.fromJson(element));
      }
      return [true, projeler];
    } else {
      return [false, veri['mesaj']]; // Future<List>
      // alt_mesaj(context, veri['mesaj']); // Future<Map>
    }
  }

  Future<List> siparisleri_getir({String order = "sip_id DESC", String limit = "3"}) async { // BuildContext context sildim

/* {bool son_siparisler = true}
  String limit = "";
    String order = "";
    if (son_siparisler) {
      limit = "3";
      order = "sip_id DESC"; // son eklenen sip getir asc olursa ilk eklene siparşleri getir
    }

*/
    Map veri = await istek(1, limit: limit, order: order,);
    List<SiparisModel> siparisler = [];
    if (veri['durum'] == 'ok') {
      for (var element in veri['siparisler']) {
        siparisler.add(SiparisModel.fromJson(element));
      }
      return [true, siparisler];
    } else {
      return [false, veri['mesaj']]; // Future<List>
      // alt_mesaj(context, veri['mesaj']); // Future<Map>
    }
  }
}
