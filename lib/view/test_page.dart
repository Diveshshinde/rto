import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rto_app/controller/test_category_controller.dart';
import 'package:rto_app/helperclass/drawer_class.dart';
import 'package:rto_app/model/test_category_modal.dart';
import 'package:rto_app/view/startexampage.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TestCategoryController controller = Get.put(TestCategoryController());

    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: const Text('Test'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.data.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            itemCount: controller.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.70,
            ),
            itemBuilder: (context, index) {
              final Testcategory cat = controller.data[index];

              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => Startexampage(
                      catId: cat.id ?? '',
                      catName: cat.catName ?? '',
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child:
                                (cat.catImage != null &&
                                    cat.catImage!.isNotEmpty)
                                ? Image.network(
                                    cat.catImage!,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.category, size: 28),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          cat.catName ?? "",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          cat.description ?? "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),

                        const Spacer(),

                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
