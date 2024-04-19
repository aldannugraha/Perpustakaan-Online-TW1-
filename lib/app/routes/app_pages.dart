import 'package:get/get.dart';

import '../modules/addBook/bindings/add_book_binding.dart';
import '../modules/addBook/views/add_book_view.dart';
import '../modules/add_peminjaman/bindings/add_peminjaman_binding.dart';
import '../modules/add_peminjaman/views/add_peminjaman_view.dart';
import '../modules/baru/baru.dart';
import '../modules/book/bindings/book_binding.dart';
import '../modules/book/views/book_view.dart';
import '../modules/flash_screen/bindings/flash_screen_binding.dart';
import '../modules/flash_screen/views/flash_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home1/bindings/home1_binding.dart';
import '../modules/home1/views/home1_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/peminjaman/bindings/peminjaman_binding.dart';
import '../modules/peminjaman/views/peminjaman_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BOOK,
      page: () => const BookView(),
      binding: BookBinding(),
    ),
    GetPage(
      name: _Paths.PEMINJAMAN,
      page: () => const PeminjamanView(),
      binding: PeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PEMINJAMAN,
      page: () => const AddPeminjamanView(),
      binding: AddPeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.BARU,
      page: () => MyApp(),
    ),
    GetPage(
      name: _Paths.ADD_BOOK,
      page: () => const AddBookView(),
      binding: AddBookBinding(),
    ),
    GetPage(
      name: _Paths.HOME1,
      page: () => const Home1View(),
      binding: Home1Binding(),
    ),
    GetPage(
      name: _Paths.FLASH_SCREEN,
      page: () => const FlashScreenView(),
      binding: FlashScreenBinding(),
    ),
  ];
}
