import 'package:flutter_application_1/core/const/const.dart';
import 'package:flutter_application_1/model/songmodel.dart';
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

      return SongsModel.fromJson(json).albumSongs;
    } else {
      throw Exception('Failed to fetch music genres');
    }
  }
}
