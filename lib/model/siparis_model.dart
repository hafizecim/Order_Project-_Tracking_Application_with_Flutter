

class SiparisModel {
  int? sipId;
  String? musteriIsim;
  String? musteriMail;
  int? musteriTelefon;
  String? sipBaslik;
  String? sipTeslimTarihi;
  String? sipAciliyet;
  String? sipDurum;
  String? sipDetay;
  int? sipUcret;
  int? yuzde;
  String? dosyaYolu;

  SiparisModel(
      {this.sipId,
      this.musteriIsim,
      this.musteriMail,
      this.musteriTelefon,
      this.sipBaslik,
      this.sipTeslimTarihi,
      this.sipAciliyet,
      this.sipDurum,
      this.sipDetay,
      this.sipUcret,
      this.yuzde,
      this.dosyaYolu});

  SiparisModel.fromJson(Map<String, dynamic> json) {
    sipId = json['sip_id'];
    musteriIsim = json['musteri_isim'];
    musteriMail = json['musteri_mail'];
    musteriTelefon = json['musteri_telefon'];
    sipBaslik = json['sip_baslik'];
    sipTeslimTarihi = json['sip_teslim_tarihi'];
    sipAciliyet = json['sip_aciliyet'];
    sipDurum = json['sip_durum'];
    sipDetay = json['sip_detay'];
    sipUcret = json['sip_ucret'];
    yuzde = json['yuzde'];
    dosyaYolu = json['dosya_yolu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sip_id'] = this.sipId;
    data['musteri_isim'] = this.musteriIsim;
    data['musteri_mail'] = this.musteriMail;
    data['musteri_telefon'] = this.musteriTelefon;
    data['sip_baslik'] = this.sipBaslik;
    data['sip_teslim_tarihi'] = this.sipTeslimTarihi;
    data['sip_aciliyet'] = this.sipAciliyet;
    data['sip_durum'] = this.sipDurum;
    data['sip_detay'] = this.sipDetay;
    data['sip_ucret'] = this.sipUcret;
    data['yuzde'] = this.yuzde;
    data['dosya_yolu'] = this.dosyaYolu;
    return data;
  }
}