import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_opservapp/lib.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: DashboardView(
        sections: [
          DashboardSection(
            title: "Indicadores Socioeconomicos",
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Obx(
                  () {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...controller.sections.map((e) => SectionCard(
                            title: e.title,
                            image: e.image,
                            onTap: () {
                              controller.onSectionTap(e);
                            }))
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Image.asset(
                    "assets/img/logo.png",
                    width: 150.0,
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/img/colombia.png",
                    width: 100.0,
                    height: 100.0,
                  ),
                ],
              ),
            ],
            icon: const Icon(Icons.dashboard_outlined, size: 40.0),
          ),
          DashboardSection(
            title: "Sobre nosotros",
            children: [],
            icon: const Icon(Icons.info_outline, size: 40.0),
          ),
          DashboardSection(
              title: "Configuracion de la cuenta",
              children: [],
              icon: const Icon(Icons.account_circle_outlined, size: 40.0),
              isEndSection: true,
              isIndexable: false,
              onTap: () {
                Get.toNamed(profileRoute);
              }),
          DashboardSection(
              title: "Configuración",
              children: [],
              icon: const Icon(Icons.settings_outlined, size: 40.0),
              isEndSection: true,
              isIndexable: false,
              onTap: () {
                // TODO: Implement this route
                print("Go to settings");
              }),
        ],
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  const SectionCard(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});

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
                "http://192.168.9.42:8080/observapp/v1/storage/$image",
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
