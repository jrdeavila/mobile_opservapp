import 'package:mobile_opservapp/lib.dart';

abstract class IConsultSectionsUseCase {
  Future<Iterable<Section>> getSections();
}

abstract class IConsultExtendedSectionUseCase {
  Future<ExtendedSection> getSection(Section section);
}

abstract class INavigateToDashboardUseCase {
  void navigateToSubSection(SubSection subSection);
}
