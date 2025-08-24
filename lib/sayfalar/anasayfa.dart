import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ElevatedButton(onPressed: () async {
          GetStorage box = GetStorage();
          await box.remove("kul");
        }, child: Text("Çıkış Yap")),
      ),
    );
  }
}