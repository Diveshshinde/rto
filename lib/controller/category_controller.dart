import 'dart:convert';

import 'package:get/get.dart';
import 'package:rto_app/model/category_modal.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  RxList<Category> data = <Category>[].obs;
  @override
  void onInit() {
    getcategorydata();
    super.onInit();
  }

  void getcategorydata() async {
    var response = await http.get(
      Uri.parse('https://appy.trycatchtech.com/v3/rto_advanced/category_list'),
    );
    if (response.statusCode == 200) {
      data.value = Category.ofdata(jsonDecode(response.body));
    }
  }
}
