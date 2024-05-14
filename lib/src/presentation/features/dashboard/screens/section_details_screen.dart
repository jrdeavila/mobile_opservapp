import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_opservapp/src/src.dart';

class SectionDetailsScreen extends GetView<SectionDetailsController> {
  const SectionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardView(
        sections: [
          DashboardSection(
              title: controller.title,
              children: [
                Obx(() => Column(
                      children: [
                        ...controller.subSections
                            .map((subSection) => SubSectionCard(
                                  title: subSection.title,
                                  description: subSection.description,
                                  image: subSection.image,
                                  onTap: () {
                                    controller.navigateToSubSection(subSection);
                                  },
                                ))
                      ],
                    )),
              ],
              icon: const Icon(
                Icons.arrow_back,
                size: 40.0,
              ),
              isIndexable: false,
              onTap: () {
                Get.back();
              })
        ],
      ),
    );
  }
}

class SubSectionCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final VoidCallback onTap;
  const SubSectionCard({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                "$baseUrl/o/storage/$image",
                height: 130,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                      )),
                  const SizedBox(height: 10.0),
                  Text(
                    description,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
