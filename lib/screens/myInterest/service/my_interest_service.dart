import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/interest_category_model.dart';

class MyInterestService {
  Future<InterestCategoryModel?> getAllCategory() async {
    var url = Uri.parse('https://dating.paksang.com/category');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = InterestCategoryModel.fromJson(jsonDecode(response.body));
      print(data.data?.length);
      return data;
    }
  }
}
