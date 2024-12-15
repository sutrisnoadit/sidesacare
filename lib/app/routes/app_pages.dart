import 'package:get/get.dart';

import '../modules/cek_surat/bindings/cek_surat_binding.dart';
import '../modules/cek_surat/views/cek_surat_view.dart';
import '../modules/dashboardClient/bindings/dashboard_client_binding.dart';
import '../modules/dashboardClient/views/dashboard_client_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/layanan_surat/bindings/layanan_surat_binding.dart';
import '../modules/layanan_surat/views/layanan_surat_view.dart';
import '../modules/signinpage/bindings/signinpage_binding.dart';
import '../modules/signinpage/views/signinpage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNINPAGE,
      page: () => const SignInPage(),
      binding: SigninpageBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_CLIENT,
      page: () => DashboardClientView(),
      binding: DashboardClientBinding(),
    ),
    GetPage(
      name: _Paths.LAYANAN_SURAT,
      page: () => const LayananSuratView(),
      binding: LayananSuratBinding(),
    ),
    GetPage(
      name: _Paths.CEK_SURAT,
      page: () => const CekSuratView(),
      binding: CekSuratBinding(),
    ),
  ];
}
