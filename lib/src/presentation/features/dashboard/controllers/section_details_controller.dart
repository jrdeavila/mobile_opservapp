import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class SectionDetailsController extends GetxController {
  final Section section;
  final Rx<ExtendedSection?> _extendedSection = Rx<ExtendedSection?>(null);

  SectionDetailsController(this.section);

  String get title => _extendedSection.value?.title ?? section.title;

  String get image => _extendedSection.value?.image ?? section.image;
  List<SubSection> get subSections =>
      _extendedSection.value?.subSections.toList() ?? [];

  @override
  void onReady() {
    super.onReady();
    _fetchExtendedSection();
  }

  void _fetchExtendedSection() {
    getIt<IConsultExtendedSectionUseCase>()
        .getSection(section)
        .then((value) => _extendedSection.value = value);
  }

  void navigateToSubSection(SubSection subSection) {
    getIt<INavigateToDashboardUseCase>().navigateToSubSection(subSection);
  }
}
