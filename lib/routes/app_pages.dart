import 'package:get/get.dart';
import 'package:mm_ex_rate/pages/about/about.dart';
import 'package:mm_ex_rate/pages/home/home.dart';
import 'package:mm_ex_rate/routes/app_routes.dart';

class AppPages {
  static List<GetPage<dynamic>> pages = [
    GetPage(name: Routes.home, page: () => const Home()),
    GetPage(
      name: Routes.about,
      page: () => const About(),
      transition: Transition.leftToRight,
    ),
  ];
}
