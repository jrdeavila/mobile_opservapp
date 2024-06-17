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
                Obx(() => Wrap(
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
    final cardWidth = MediaQuery.of(context).size.width > 600 ? 400.0 : 300.0;
    final cardHeight = MediaQuery.of(context).size.width > 600 ? 300.0 : 200.0;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  "$baseUrl/o/storage/$image",
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Divider(
              color: Theme.of(context).colorScheme.primary,
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
