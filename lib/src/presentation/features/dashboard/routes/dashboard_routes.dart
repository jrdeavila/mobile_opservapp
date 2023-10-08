import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

const dashboardRoute = '/dashboard';
const createdBusinessRoute = '/created-business';

final dashboardPages = [
  GetPage(
    name: dashboardRoute,
    page: () => const DashboardScreen(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: createdBusinessRoute,
    page: () => const CreatedBusinessScreen(),
  ),
];
