import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

const dashboardRoute = '/dashboard';
const sectionDetailsRoute = '/section-details';

final dashboardPages = [
  GetPage(
    name: dashboardRoute,
    page: () => const DashboardScreen(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: sectionDetailsRoute,
    page: () => const SectionDetailsScreen(),
    binding: SectionDetailsBindings(),
  ),
];
