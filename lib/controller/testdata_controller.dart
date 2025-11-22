import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rto_app/model/testdata_modal.dart';

class TestdataController extends GetxController {
  final String catId;   
  TestdataController(this.catId);  

  RxList<Testdata> data = <Testdata>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    gettestdata();
    super.onInit();
  }

  void gettestdata() async {
    try {
      isLoading.value = true;

      var response = await http.get(
        Uri.parse(
          'https://appy.trycatchtech.com/v3/rto_advanced/test_data?cat_id=$catId',
        ),
      );

      if (response.statusCode == 200) {
        data.value = Testdata.ofdata(jsonDecode(response.body));
      }
    } finally {
      isLoading.value = false;
    }
  }
}
