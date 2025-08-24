class ProjeModel {
  int? projeId;
  String? projeBaslik;
  String? projeTeslimTarihi;
  String? projeAciliyet;
  String? projeDurum;
  String? projeDetay;
  int? yuzde;
  String? dosyaYolu;

  ProjeModel(
      {this.projeId,
      this.projeBaslik,
      this.projeTeslimTarihi,
      this.projeAciliyet,
      this.projeDurum,
      this.projeDetay,
      this.yuzde,
      this.dosyaYolu});

  ProjeModel.fromJson(Map<String, dynamic> json) {
    projeId = json['proje_id'];
    projeBaslik = json['proje_baslik'];
    projeTeslimTarihi = json['proje_teslim_tarihi'];
    projeAciliyet = json['proje_aciliyet'];
    projeDurum = json['proje_durum'];
    projeDetay = json['proje_detay'];
    yuzde = json['yuzde'];
    dosyaYolu = json['dosya_yolu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proje_id'] = this.projeId;
    data['proje_baslik'] = this.projeBaslik;
    data['proje_teslim_tarihi'] = this.projeTeslimTarihi;
    data['proje_aciliyet'] = this.projeAciliyet;
    data['proje_durum'] = this.projeDurum;
    data['proje_detay'] = this.projeDetay;
    data['yuzde'] = this.yuzde;
    data['dosya_yolu'] = this.dosyaYolu;
    return data;
  }
}