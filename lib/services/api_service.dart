import 'dart:convert';
import 'package:flutter_coding_challenge/Model/List_model.dart';
import 'package:flutter_coding_challenge/constents/url.dart';
import 'package:http/http.dart';

class ApiService {
  Future<List<ListModel>> getListData() async {
    String url = AppUrl.baseUrl;

    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Decode the response body to a list of Map objects
        List<dynamic> json = jsonDecode(response.body);

        // Map each item in the list to a ListModel instance
        List<ListModel> list = json.map((item) => ListModel.fromJson(item)).toList();
        return list;
      } else {
        throw Exception('Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Error fetching data: $e');
    }
  }
}
