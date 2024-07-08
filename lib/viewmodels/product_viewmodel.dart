import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_shop/services/firebase_storage_service.dart';

class ProductViewModel extends ChangeNotifier {
  final FirebaseStorageService _storageService = FirebaseStorageService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> addProduct(
      String price, File productImage, File tagImage) async {
    _setLoading(true);
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String? uid = user?.uid; // get user id

      // ignore: unused_local_variable
      final String productImageUrl = await _storageService.uploadImage(
          productImage,
          'products/${DateTime.now()}_userid_${uid}_price_${price.toString()}.jpg');

      final String fileName = productImage.path
          .split('/')
          .last; // Dosya adı 'fileName' değişkenine atanır

      // ignore: unused_local_variable
      final String tagImageUrl = await _storageService.uploadImage(tagImage,
          'tags/${DateTime.now()}_price_${price.toString()}_fileNameFromProducts_${fileName.toString()}'); // fileName değişkeninin sonu .jpg ile bittiğinden ekstra eklemedim

      // Veritabanına kaydetme işlemini buraya ekleyebilirsiniz
      // Örneğin, MongoDB veya başka bir veritabanına kaydetmek için

      _setLoading(false);
    } catch (e) {
      _setLoading(false);
      rethrow;
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
