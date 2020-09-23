import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dart_des/dart_des.dart';

class Criptografia {
  static final String _salt = '<Salt here>';

  static String criptografar(String conteudo) {
    if (conteudo.isEmpty) {
      return null;
    }
    List<int> results;
    List<int> tdesKey = md5.convert(utf8.encode(_salt)).bytes;
    DES3 tdesAlgorithm = DES3(key: tdesKey, mode: DESMode.ECB);
    List<int> originalDataToEncrypt = utf8.encode(conteudo);
    List<int> filledDataToEncrypt = completeDataArray(originalDataToEncrypt);

    try {
      results = tdesAlgorithm.encrypt(filledDataToEncrypt);
      print(results);
    } finally {}
    return base64Encode(results);
  }

  static List<int> completeDataArray(List<int> dataToBeEncrypted) {
    List<int> filledDataToEncrypt =
        Uint8List((dataToBeEncrypted.length / 8).ceil() * 8);
    for (var i = 0; i < dataToBeEncrypted.length; i++) {
      filledDataToEncrypt[i] = dataToBeEncrypted[i];
    }
    return filledDataToEncrypt;
  }
}
