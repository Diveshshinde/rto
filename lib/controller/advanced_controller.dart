import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rto_app/model/advance_modal.dart';

class AdvancedController extends GetxController {
  RxList<Advanceddata> data = <Advanceddata>[].obs;
  @override
  void onInit() {
    getadvancedata();
    super.onInit();
  }

  void getadvancedata() async {
    var response = await http.get(
      Uri.parse(
        'https://appy.trycatchtech.com/v3/rto_advanced/post_list?cat_id=1&level=advanced',
      ),
    );
    if (response.statusCode == 200) {
      data.value = Advanceddata.ofdata(jsonDecode(response.body));
    }
  }
}
