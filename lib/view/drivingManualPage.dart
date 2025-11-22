import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rto_app/controller/beginner_controller.dart';
import 'package:rto_app/controller/intermediate_controller.dart';
import 'package:rto_app/controller/advanced_controller.dart';
import 'package:rto_app/view/manualDetailPage.dart';

class DrivingManualPage extends StatelessWidget {
  const DrivingManualPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beginnerC = Get.put(BeginnerController());
    final intermediateC = Get.put(IntermediateController());
    final advancedC = Get.put(AdvancedController());

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          title: const Text("Driving Manuals"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          bottom: const TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: "Beginner"),
              Tab(text: "Intermediate"),
              Tab(text: "Advanced"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _BeginnerList(controller: beginnerC),
            _IntermediateList(controller: intermediateC),
            _AdvancedList(controller: advancedC),
          ],
        ),
      ),
    );
  }
}

class _ManualRow extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _ManualRow({Key? key, required this.title, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BeginnerList extends StatelessWidget {
  final BeginnerController controller;

  const _BeginnerList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.data.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: controller.data.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = controller.data[index];

          return _ManualRow(
            title: item.name ?? '',
            onTap: () {
              Get.to(
                () => ManualDetailPage(
                  title: item.name ?? '',
                  description: item.description ?? '',
                ),
              );
            },
          );
        },
      );
    });
  }
}

class _IntermediateList extends StatelessWidget {
  final IntermediateController controller;

  const _IntermediateList({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.data.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: controller.data.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = controller.data[index];

          return _ManualRow(
            title: item.name ?? '',
            onTap: () {
              Get.to(
                () => ManualDetailPage(
                  title: item.name ?? '',
                  description: item.description ?? '',
                ),
              );
            },
          );
        },
      );
    });
  }
}

class _AdvancedList extends StatelessWidget {
  final AdvancedController controller;

  const _AdvancedList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.data.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: controller.data.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = controller.data[index];

          return _ManualRow(
            title: item.name ?? '',
            onTap: () {
              Get.to(
                () => ManualDetailPage(
                  title: item.name ?? '',
                  description: item.description ?? '',
                ),
              );
            },
          );
        },
      );
    });
  }
}
