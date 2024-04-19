import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 200.0),
                    child: Image(
                      image: AssetImage('assets/logo.png'),
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
                  Text(
                    'Login bro',
                    style: TextStyle(
                      fontSize: 20,
                      height: -20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            hintText: "Masukkan Username",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.length < 2) {
                              return "Username tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: "Masukkan Password",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value!.length < 2) {
                              return "Password tidak boleh kosong";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        Obx(() => controller.loading.value
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                          onPressed: () {
                            controller.login();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          child: Text("Login"),
                        )),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.REGISTER),
                          child: Text(
                            "Registrasi",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Center(
            child: GestureDetector(
              onTap: () {
              },
              child: Text(
                'Copyright ©Meildy 2024',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}