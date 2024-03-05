import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;


import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController nama = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController alamat = TextEditingController();
  final TextEditingController telp = TextEditingController();
  final loading = false.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addAkun() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.register, data: {
          "nama": nama.text.toString(),
          "username": username.text.toString(),
          "telp": telp.text.toString(),
          "alamat": alamat.text.toString(),
          "password": password.text.toString(),
        });
        if (response.statusCode == 201) {
          Get.back();
          Get.snackbar("Berhasil", "Menambahkan Akun",
              backgroundColor: Colors.green);
        } else {
          Get.snackbar("Sorry", "Menambahkan Akun Gagal",
              backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

  void increment() => count.value++;
}