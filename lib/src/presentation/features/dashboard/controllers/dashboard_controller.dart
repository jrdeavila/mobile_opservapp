import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class DashboardController extends GetxController {
  final RxInt _currentIndex = RxInt(0);
  final RxList<Section> _sections = RxList<Section>([]);

  List<Section> get sections => _sections;
  int get currentIndex => _currentIndex.value;

  @override
  void onReady() {
    super.onReady();
    _fetchSections();
  }

  void _fetchSections() async {
    final sections = await getIt<IConsultSectionsUseCase>().getSections();
    _sections.value = sections.toList();
  }

  void onIndexChanged(int index) {
    _currentIndex.value = index;
  }

  void onSectionTap(Section section) {
    Get.toNamed(sectionDetailsRoute, arguments: section);
  }
}
