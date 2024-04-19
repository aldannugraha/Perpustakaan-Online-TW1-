import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_book.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookView'),
        centerTitle: true,
      ),
      body: controller.obx(
            (state) {
          if (state == null) {
            // Menampilkan widget loading jika state null
            return Center(child: CupertinoActivityIndicator());
          } else {
            return ListView.separated(
              itemCount: state.length,
              itemBuilder: (context, index) {
                DataBook dataBook = state[index];
                return ListTile(
                  leading: SizedBox(
                    width: 45,
                    height: 100,
                    child: Image.network(
                      "${Endpoint.imagesBaseUrl}${dataBook.gambar}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text("${dataBook.judul}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Penulis: "),
                          Text(
                            "${dataBook.penulis}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text("${dataBook.penerbit} - ${dataBook.tahunTerbit}"),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.ADD_PEMINJAMAN,
                        parameters: {
                          'id': (dataBook.id ?? 0).toString(),
                          'judul': dataBook.judul ?? '-'
                        }),
                    child: Text("Pinjam"),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
            );
          }
        },
      ),
    );
  }
}
