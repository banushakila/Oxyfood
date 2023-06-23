import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';




class ApiClient {
  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      final response = await http.post(
        Uri.parse('https://demo.trainingzone.in/api/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );
      return jsonDecode(response.body);
    } catch (e) {
      return e.toString();
    }
  }

  Future< dynamic> loginUser(String email, String password) async {
    try {
      var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer 11|XQVyVZuG9yoxLCW0PNiv4GxixnIXpf1enU887YUa'
};
var request = http.Request('POST', Uri.parse('https://demo.trainingzone.in/api/login'));
request.body = json.encode({
  "email": "ajay121@mail.com",
  "password": "Test@123"
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}
} catch (e) {
            return e.toString();

    }
  }


  Future<dynamic> getUserProfileData(String accessToken) async {
    try {
      var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer $accessToken'};
var request = http.Request('GET', Uri.parse('https://demo.trainingzone.in/api/user/me'));
request.body = json.encode({
  "email": "ajay121@mail.com",
  "password": "Test@123"
});
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}
} catch (e) {
            return e.toString();

    }

  }
  Future<dynamic> updateUserProfile({
    required String accessToken,
    required Map<String, dynamic> data
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://demo.trainingzone.in/api/user/dashboard'),
        headers: {
          'Content-Type': 'application/json',
                      'Accept': 'application/json',

          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode(data),
      );
      return jsonDecode(response.body);
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> logout(String accessToken) async {
    try {
      final response = await http.get(
        Uri.parse('https://demo.trainingzone.in/access_token/InValidate'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      return e.toString();
    }
  }
}