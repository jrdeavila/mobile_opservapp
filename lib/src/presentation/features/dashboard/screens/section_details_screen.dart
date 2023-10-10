import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class SectionDetailsScreen extends GetView<SectionDetailsController> {
  const SectionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => DashboardView(
        title: controller.title,
        image: sectionImageUrl(controller.image),
        children: controller.subSections
            .map(
              (e) => DashboardCard(
                title: e.title,
                image: sectionImageUrl(e.image),
                onTap: () {
                  controller.navigateToSubSection(e);
                },
              ),
            )
            .toList(),
      ),
    ));
  }
}
