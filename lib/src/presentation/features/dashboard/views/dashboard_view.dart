import 'package:flutter/material.dart';
import 'package:mobile_opservapp/lib.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({
    super.key,
    this.title,
    this.image,
    this.children = const [],
  });

  final String? title;
  final String? image;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackground(context),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: Colors.transparent,
              toolbarHeight: 100,
              leadingWidth: 200.0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  child: Image.asset(
                    "assets/img/small_log.png",
                  ),
                ),
              ),
              actions: const [
                UserAccountTag(),
                SizedBox(width: 20),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title ?? "Dashboard",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildDasboardCard(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _buildBackground(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                image: image != null
                    ? DecorationImage(
                        image: NetworkImage(image!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            )),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Container _buildDasboardCard(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      width: MediaQuery.of(context).size.width * 0.93,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).colorScheme.background,
      ),
      child: GridView(
        padding: const EdgeInsets.all(16.0),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        children: children,
      ),
    );
  }
}
