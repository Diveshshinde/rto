import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rto_app/model/beginner_modal.dart';

class BeginnerController extends GetxController {
  RxList<Beginnerdata> data = <Beginnerdata>[].obs;
  @override
  void onInit() {
    getbeginnerdata();
    super.onInit();
  }

  void getbeginnerdata() async {
    var response = await http.get(
      Uri.parse(
        'https://appy.trycatchtech.com/v3/rto_advanced/post_list?cat_id=1&level=beginner',
      ),
    );
    if (response.statusCode == 200) {
      data.value = Beginnerdata.ofdata(jsonDecode(response.body));
    }
  }
}
