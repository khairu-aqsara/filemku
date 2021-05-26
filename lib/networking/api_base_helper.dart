import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:info_filem/networking/api_exceptions.dart';
import 'dart:async';

class ApiBaseHelper {
  final String _baseUrl = "https://api.themoviedb.org/3/";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("Tidak ada Koneksi Internet");
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Terjadi Error saat menghubungi server Dengan status Code : ${response.statusCode}');
    }
  }
}
