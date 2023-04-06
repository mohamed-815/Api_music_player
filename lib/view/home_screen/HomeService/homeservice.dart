import 'package:flutter_application_1/core/const/const.dart';
import 'package:flutter_application_1/model/gridclass.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeService {
  Future<List<MusicGenre>?>? FechtheId() async {
    final url = Uri.parse(Constants().gridapi);
    final header = {'Content-Type': 'application/x-www-form-urlencoded'};
    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      return GridClass.fromJson(json).musicGenre;
    } else {
      throw Exception('Failed to fetch music genres');
    }
  }
}
