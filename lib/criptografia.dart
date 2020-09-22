import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:tripledes/tripledes.dart';

class Criptografia {
  static final String _salt = "#6KVYdPD7wYz2+JQ4LZ2nhA712m642r\$";

  static String criptografar(String conteudo) {
    if (conteudo.isEmpty) {
      return null;
    }
    var results;
    List<int> tdesKey = md5.convert(utf8.encode(_salt)).bytes;
    // DES3 tdesAlgorithm = DES3(key: tdesKey, mode: DESMode.ECB);
    var blockCipher = BlockCipher(TripleDESEngine(), _salt);
    // tdesAlgorithm.key = tdesKey;
    List<int> dataToEncrypt = utf8.encode(conteudo);

    try {
      // results = tdesAlgorithm.process(dataToEncrypt);
      results = blockCipher.encodeB64(conteudo);
      // results = blockCipher.decodeB64('Js3423@!nx');
    } finally {}
    return results;
  }

  static String decriptografar(String conteudo) {
    if (conteudo.isEmpty) {
      return null;
    }
    var results;
    List<int> tdesKey = md5.convert(utf8.encode(_salt)).bytes;
    // DES3 tdesAlgorithm = DES3(key: tdesKey, mode: DESMode.ECB);
    var blockCipher = BlockCipher(TripleDESEngine(), _salt);
    // tdesAlgorithm.key = tdesKey;
    List<int> dataToEncrypt = utf8.encode(conteudo);

    try {
      // results = tdesAlgorithm.process(dataToEncrypt);
      results = blockCipher.decodeB64(conteudo);
      // results = blockCipher.decodeB64('Js3423@!nx');
    } finally {}
    return results;
  }
}
