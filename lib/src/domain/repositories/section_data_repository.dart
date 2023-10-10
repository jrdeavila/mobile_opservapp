import 'package:mobile_opservapp/lib.dart';

abstract class ISectionDataRepository {
  Future<Iterable<Section>> getSections();

  Future<ExtendedSection> getSection(Section section);
}
