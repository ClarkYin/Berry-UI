import 'dart:async';
import 'dart:convert';
import 'package:berry/berry_app/models/account_data.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class HttpService {
  Future<AccountData> fetchAccountData() async {
    final response = await http.get(
        'https://berry-user.azurewebsites.net/api/mock-users?code=LXD/xZIkUG1Q0OKNAcn2Ilq1Bk0WEeIxkBa28/X2AklawHkJoaFm0w==');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log('success');
      return AccountData.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load account data');
    }
  }
}
