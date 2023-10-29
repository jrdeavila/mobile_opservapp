import 'package:awesome_icons/awesome_icons.dart';
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
            children: [
              const Text(
                "VALLEDUPAR CHAMBER OF COMMERCE FOR THE CESAR RIVER VALLEY",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              const Divider(),
              const SizedBox(height: 20.0),
              Text(
                "Social Medias",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FontAwesomeIcons.facebook,
                  FontAwesomeIcons.twitter,
                  FontAwesomeIcons.instagram,
                  FontAwesomeIcons.youtube,
                ]
                    .map((e) => Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Icon(e, size: 25.0),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20.0),
              const Divider(),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Main Headquarters:",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    "Calle 15 No. 4 – 33 Valledupar – Cesar",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    "Reciving Office:",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    "Carrera 4 No. 15 – 36 Valledupar – Cesar",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              Row(
                children: [
                  Image.asset("assets/img/govco.png", width: 200.0),
                  const Spacer(),
                  Image.asset("assets/img/colombia.png", width: 80.0),
                ],
              ),
            ],
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
                "$baseUrl$sectionsDomainEndpoint/storage/$image",
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
