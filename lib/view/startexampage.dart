import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rto_app/controller/testdata_controller.dart';

class Startexampage extends StatelessWidget {
  final String catId;
  final String catName;

  const Startexampage({Key? key, required this.catId, required this.catName})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TestdataController testController = Get.put(
      TestdataController(catId),
    );

    return Scaffold(
      appBar: AppBar(title: Text(catName)),
      body: Obx(() {
        if (testController.data.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: testController.data.length,
          itemBuilder: (context, index) {
            final q = testController.data[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      q.question ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('A) ${q.option1 ?? ''}'),
                    Text('B) ${q.option2 ?? ''}'),
                    Text('C) ${q.option3 ?? ''}'),
                    Text('D) ${q.option4 ?? ''}'),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
