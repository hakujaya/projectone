import 'package:flutter/material.dart';

class Tunai {
  Tunai(
      {@required this.jenisTunaiMasuk,
      @required this.keterangan,
      @required this.ringgit,
      @required this.tarikhMasa});

  final String jenisTunaiMasuk;
  final String keterangan;
  final int ringgit;
  final DateTime tarikhMasa;

  Map<String, dynamic> data() {
    return {
      "Ringgit": ringgit,
      "Keterangan": keterangan,
      "Tarikh dan Masa": tarikhMasa,
      "Jenis Tunai Masuk": jenisTunaiMasuk,
    };
  }
}
