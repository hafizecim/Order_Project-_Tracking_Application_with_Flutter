import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:order_project_tracking_application/sabitler/ext.dart';
import 'package:order_project_tracking_application/sayfalar/anasayfa.dart';
import 'package:order_project_tracking_application/sayfalar/oturum/giris.dart';

main() async {

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: oturum_kontrol()? AnaSayfa() : GirisSayfasi(), // eğer oturum açıksa Anasayfa ya değilse giriş sayfasına gitsin
    );
  }
}

