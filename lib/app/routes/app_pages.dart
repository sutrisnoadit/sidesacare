import 'package:get/get.dart';

import '../modules/admin/dashboard/bindings/admin_dashboard_binding.dart';
import '../modules/admin/dashboard/views/admin_dashboard_view.dart';
import '../modules/admin/layananPengajuanSuratAdmin/bindings/layanan_pengajuan_surat_admin_binding.dart';
import '../modules/admin/layananPengajuanSuratAdmin/views/layanan_pengajuan_surat_admin_view.dart';
import '../modules/admin/pengaduanaadmin/bindings/pengaduanaadmin_binding.dart';
import '../modules/admin/pengaduanaadmin/views/pengaduanaadmin_view.dart';
import '../modules/admin/pengumuman/bindings/admin_pengumuman_binding.dart';
import '../modules/admin/pengumuman/views/admin_pengumuman_view.dart';
import '../modules/admin/pengumuman/views/buat_pengumuman_view.dart';
import '../modules/admin/statistik/bindings/statistik_binding.dart';
import '../modules/admin/statistik/views/statistik_view.dart';
import '../modules/client/cek_surat/bindings/cek_surat_binding.dart';
import '../modules/client/cek_surat/views/cek_surat_view.dart';
import '../modules/client/dashboardClient/bindings/dashboard_client_binding.dart';
import '../modules/client/dashboardClient/views/dashboard_client_view.dart';
import '../modules/client/layanan_surat/bindings/layanan_surat_binding.dart';
import '../modules/client/layanan_surat/views/layanan_surat_view.dart';
import '../modules/client/pengaduan/bindings/pengaduan_binding.dart';
import '../modules/client/pengaduan/views/pengaduan_view.dart';
import '../modules/client/pengumumanClient/bindings/pengumuman_client_binding.dart';
import '../modules/client/pengumumanClient/views/pengumuman_client_view.dart';
import '../modules/client/surat/domisili/bindings/admin_surat_domisili_binding.dart';
import '../modules/client/surat/domisili/views/admin_surat_domisili_view.dart';
import '../modules/client/surat/ijinKeramaian/bindings/admin_surat_ijin_keramaian_binding.dart';
import '../modules/client/surat/ijinKeramaian/views/admin_surat_ijin_keramaian_view.dart';
import '../modules/client/surat/kehilangan/bindings/admin_surat_kehilangan_binding.dart';
import '../modules/client/surat/kehilangan/views/admin_surat_kehilangan_view.dart';
import '../modules/client/surat/ktp/bindings/admin_surat_ktp_binding.dart';
import '../modules/client/surat/ktp/views/admin_surat_ktp_view.dart';
import '../modules/client/surat/pengantar/bindings/admin_surat_pengantar_binding.dart';
import '../modules/client/surat/pengantar/views/admin_surat_pengantar_view.dart';
import '../modules/client/surat/skck/bindings/admin_surat_skck_binding.dart';
import '../modules/client/surat/skck/views/admin_surat_skck_view.dart';
import '../modules/client/surat/usaha/bindings/admin_surat_usaha_binding.dart';
import '../modules/client/surat/usaha/views/admin_surat_usaha_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/admin/informasi/bindings/informasi_binding.dart';
import '../modules/admin/informasi/views/informasi_view.dart';
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
    GetPage(
      name: _Paths.ADMIN_DASHBOARD,
      page: () => const AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_PENGUMUMAN,
      page: () => const AdminPengumumanView(),
      binding: AdminPengumumanBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SURAT_SKCK,
      page: () => AdminSuratSkckView(),
      binding: AdminSuratSkckBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SURAT_KTP,
      page: () => AdminSuratKtpView(),
      binding: AdminSuratKtpBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SURAT_PENGANTAR,
      page: () => AdminSuratPengantarView(),
      binding: AdminSuratPengantarBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SURAT_USAHA,
      page: () => AdminSuratUsahaView(),
      binding: AdminSuratUsahaBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SURAT_DOMISILI,
      page: () => AdminSuratDomisiliView(),
      binding: AdminSuratDomisiliBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SURAT_IJIN_KERAMAIAN,
      page: () => AdminSuratIjinKeramaianView(),
      binding: AdminSuratIjinKeramaianBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SURAT_KEHILANGAN,
      page: () => AdminSuratKehilanganView(),
      binding: AdminSuratKehilanganBinding(),
    ),
    GetPage(
      name: _Paths.LAYANAN_PENGAJUAN_SURAT_ADMIN,
      page: () => LayananPengajuanSuratAdminView(),
      binding: LayananPengajuanSuratAdminBinding(),
    ),
    GetPage(
      name: _Paths.PENGUMUMAN_CLIENT,
      page: () => const PengumumanClientView(),
      binding: PengumumanClientBinding(),
    ),
    GetPage(
      name: _Paths.PENGADUAN,
      page: () => const PengaduanView(),
      binding: PengaduanBinding(),
    ),
    GetPage(
      name: _Paths.PENGADUANAADMIN,
      page: () => const PengaduanaadminView(),
      binding: PengaduanaadminBinding(),
    ),
    GetPage(
      name: _Paths.STATISTIK,
      page: () => const StatistikView(),
      binding: StatistikBinding(),
    ),
    GetPage(
      name: _Paths.INFORMASI,
      page: () => const InformasiView(),
      binding: InformasiBinding(),
    ),
  ];
}
