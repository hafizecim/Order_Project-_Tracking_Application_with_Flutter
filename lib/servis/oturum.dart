import 'package:http/http.dart' as http;
import 'package:order_project_tracking_application/sabitler/ext.dart';

class Oturum {
  oturum_ac(String mail, String sifre) async {
    http.Response sonuc = await http.post(
      Uri.parse(api_link),
      body: {'oturumac': 'true', 'kul_mail': mail, 'kul_sifre': sifre},
    );
    
    print(sonuc.statusCode);
    print("Response Body: ${sonuc.body}");

    if (sonuc.statusCode == 200) {
      //200 bağlantı işlemi başarılı ise
      print(sonuc.body);
    } else {
      return [
        false,
        "İşleminize Şu anda gerçekleştirmiyoruz. Lütfen daha sonr tekrar deneyin",
      ];
    }
  }
}
