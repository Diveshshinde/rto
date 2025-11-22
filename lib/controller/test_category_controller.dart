import 'dart:convert';

import 'package:get/get.dart';
import 'package:rto_app/model/test_category_modal.dart';
import 'package:http/http.dart' as http;

class TestCategoryController extends GetxController {
  RxList<Testcategory> data = <Testcategory>[].obs;
  @override
  void onInit() {
   
    getdata();
    super.onInit();
  }

  void getdata() async {
    var response = await http.get(
      Uri.parse(
        'https://appy.trycatchtech.com/v3/rto_advanced/test_category_list',
      ),
    );
    if (response.statusCode == 200) {
      data.value = Testcategory.ofdata(jsonDecode(response.body));
    }
  }
}
