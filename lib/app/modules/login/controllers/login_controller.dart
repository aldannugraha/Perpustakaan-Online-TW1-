import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:peminjam_perpustakaan_kelas_c/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_login.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';

import '../../../data/provider/storage_provider.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    String status = StorageProvider.read(StorageKey.status);
    String role = StorageProvider.read(StorageKey.role);
    log("status : $status, role : $role");
    if (status == 'logged') {
      if (role == 'PEMINJAM') {
        Get.offAllNamed(Routes.HOME);
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: dio.FormData.fromMap(
                {"username": usernameController.text.toString(),
                  "password": passwordController.text.toString()}));
        if (response.statusCode == 200) {
          final ResponseLogin responseLogin = ResponseLogin.fromJson(response.data);
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(StorageKey.role, responseLogin.data!.role!);
          await StorageProvider.write(StorageKey.idUser, responseLogin.data!.id!.toString());
          await StorageProvider.write(
              StorageKey.username, usernameController.text.toString());
          Get.offAllNamed(Routes.HOME); // Navigasi ke halaman home setelah login berhasil
        } else {
          Get.snackbar("Sorry", "Login failed", backgroundColor: Colors.orange);
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
