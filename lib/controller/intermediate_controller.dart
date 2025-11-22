import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rto_app/model/intermediate_modal.dart';

class IntermediateController extends GetxController {
  RxList<Intermediatedata> data = <Intermediatedata>[].obs;
  @override
  void onInit() {
    getintermediatedata();
    super.onInit();
  }

  void getintermediatedata() async {
    var response = await http.get(
      Uri.parse('https://appy.trycatchtech.com/v3/rto_advanced/post_list?cat_id=1&level=intermediate'),
    );
    if (response.statusCode == 200) {
      data.value = Intermediatedata.ofdata(jsonDecode(response.body));
    }
  }
}
