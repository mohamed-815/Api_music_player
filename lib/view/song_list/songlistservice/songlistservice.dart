import 'package:flutter_application_1/const/const.dart';
import 'package:flutter_application_1/model/gridclass.dart';
import 'package:flutter_application_1/model/songmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SongListservice {
  Future<List<AlbumSongs>?>? Fechthesong(id) async {
    final url = Uri.parse(Constants().songlistapi);
    final header = {'Content-Type': 'application/x-www-form-urlencoded'};
    final body = {'album_id': id.toString()};
    final response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      print('newjson.................song detail');
      print(json);
      print('..........');
      print(SongsModel.fromJson(json).albumSongs);
      return SongsModel.fromJson(json).albumSongs;
    } else {
      throw Exception('Failed to fetch music genres');
    }
  }
}
