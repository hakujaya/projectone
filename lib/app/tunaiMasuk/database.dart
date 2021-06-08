import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_ras/app/tunaiMasuk/tunai.dart';

abstract class Database {
  Future<void> createTunai(Tunai tunai);
}

class FireStoreDatabase implements Database {
  Future<void> createTunai(Tunai tunai) async {
    final path = '/User';
    final documentReference = FirebaseFirestore.instance.collection(path);
    await documentReference.add(tunai.data());
  }
}
