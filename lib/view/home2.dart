import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:rto_app/controller/category_controller.dart';

import 'package:rto_app/controller/test_category_controller.dart';
import 'package:rto_app/helperclass/drawer_class.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final TestCategoryController _controller = Get.put(TestCategoryController());
  final CategoryController _Controller = Get.put(CategoryController());

  final myitems = [
    Image.asset('assets/Component 8@4x (1).png', fit: BoxFit.cover),
    Image.asset('assets/Component 8@4x (2).png', fit: BoxFit.cover),
  ];

  int myCurrentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D9CDB),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Road Master', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 200,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                },
              ),
              items: myitems.map((w) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(width: double.infinity, child: w),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Test',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 140,
              child: Obx(() {
                final list = _controller.data;
                if (list.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return _buildCategoryCard(item);
                  },
                );
              }),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: Obx(() {
                final list = _Controller.data;
                if (list.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return _buildCategoryCard(item);
                  },
                );
              }),
            ),

            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(dynamic item) {
    final imageUrl = item.catImage ?? '';
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 1),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        width: double.infinity,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.broken_image,
                          size: 40,
                          color: Colors.grey,
                        ),
                      )
                    : const Icon(Icons.image, size: 40, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 8),

            Text(
              item.catName ?? 'No name',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
