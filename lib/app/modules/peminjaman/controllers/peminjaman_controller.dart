import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_pinjam.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class PeminjamanController extends GetxController with StateMixin<List<DataPinjam>> {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  Future<void> getData() async {
    //kalau pke void ada nilai baliknya, jadi ngga perlu return
    // getData(){ kalo ngga pakai void type nya dinamic, di kasih return boleh, tdk juga boleh
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get("${Endpoint
          .pinjam}/${StorageProvider.read(StorageKey.idUser)}"); //fungsi await, baris code di bawah menunggu proses await ini selesai. jika tdk pakai, maka codingan di bawah ini dieksekusi barengan
      if (response.statusCode == 200) {
        final ResponsePinjam responsePinjam = ResponsePinjam.fromJson(response.data);
        if (responsePinjam.data!.isEmpty) {
          //apakah data dari response diatas kosong?
          //jika kosong kita change status nya ke empty
          change(null, status: RxStatus.empty());
        } else {
          // jika ada kita ubah statusnya menjadi success
          change(responsePinjam.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      //catch di try artinya apakah errornya ada di dio?
      //jika iya data dibawah ini akan dieksekusi
      change(null, status: RxStatus.error("Error ${e.message}"));
    } catch (e) {
      //jika tidak, maka perintah di bawah ini yg akan dieksekusi
      change(null, status: RxStatus.error("Error $e"));
    }
  }
}