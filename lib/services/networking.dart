import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    var decodedData;

    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      decodedData = jsonDecode(data);
    } else {
      print(response.statusCode);
    }
    return decodedData;
  }
}
