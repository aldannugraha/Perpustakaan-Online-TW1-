import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // Panggil fungsi logout saat tombol logout ditekan
                controller.logout();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xd4d4d4).withOpacity(1),
                          offset: Offset(3, 3),
                          blurRadius: 2,
                          spreadRadius: 0,
                        )
                      ]),
                  height: 100,
                  width: 170,
                  child: ElevatedButton(
                    onPressed: (){Get.toNamed(Routes.BOOK);}, child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.book, size: 50),
                      Text("Buku", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                    ],
                  ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xd4d4d4).withOpacity(1),
                          offset: Offset(3, 3),
                          blurRadius: 2,
                          spreadRadius: 0,
                        )
                      ]),
                  height: 100,
                  width: 170,
                  child: ElevatedButton(
                    onPressed: (){Get.toNamed(Routes.BARU);}, child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.book, size: 50),
                      Text("Baru", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                    ],
                  ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xd4d4d4).withOpacity(1),
                          offset: Offset(3, 3),
                          blurRadius: 2,
                          spreadRadius: 0,
                        )
                      ]),
                  height: 100,
                  width: 170,
                  child: ElevatedButton(
                    onPressed: (){Get.toNamed(Routes.PEMINJAMAN);}, child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.person, size: 50),
                      Text("Pinjam", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                    ],
                  ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xd4d4d4).withOpacity(1),
                          offset: Offset(3, 3),
                          blurRadius: 2,
                          spreadRadius: 0,
                        )
                      ]),
                  height: 100,
                  width: 170,
                  child: ElevatedButton(
                    onPressed: (){Get.toNamed(Routes.ADD_BOOK);}, child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.person, size: 50),
                      Text("contoh", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
                    ],
                  ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),

          ],
        )
    );
  }
}